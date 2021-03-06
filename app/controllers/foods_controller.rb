class FoodsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show, :search, :more]
  before_action :set_food, only: [:edit, :update, :show, :destroy]

  def top
    render layout: nil
  end

  def index
    @foods_1 = Food.order("RAND()").limit(3)
    @foods_2 = Food.order("RAND()").limit(3).where.not(id: @foods_1.map{|f| f.id})
    @foods_3 = Food.order("RAND()").limit(3).where.not(id: @foods_1.map{|f| f.id}).where.not(id: @foods_2.map{|f| f.id})
    @meat_foods = Food.where(category_id: "肉").limit(3).order("created_at desc")
    @ve_foods = Food.where(category_id: "野菜").limit(3).order("created_at desc")
    @side_foods = Food.where(category_id: "時短").limit(3).order("created_at desc")

    # インクリメンタルサーチ用変数
    @search = Food.where("food_name like(?)", "%#{params[:input]}%" ).limit(10)
  end

  def new
    @food = Food.new
    @food.foodstuffs.build
    @food.recipes.build
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      render layout: nil
    else
      render action: :new
    end
  end

  def edit
    # set_food
  end

  def update
    # set_food
    if @food.update(food_params)
      render layout: nil
    else
      render action: :edit
    end
  end

  def show
    # set_food
    @foodstuffs = @food.foodstuffs
    @recipes = @food.recipes
    @good = @food.goods
    if @food.category_id == "時短"
      @side_foods = Food.where(category_id: "時短").order("RAND()").limit(6)
    else
      @other_category = Food.where(category_id: @food.category_id).order("RAND()").limit(3)
      @side_foods = Food.where(category_id: "時短").order("RAND()").limit(3)
    end
  end

  def destroy
    # set_food
    if @food.destroy
      render layout: nil
    else
      render action: :edit
    end
  end

  def search
    if params[:search] != nil
      @input = params[:search]
      @foods = Food.where("food_name LIKE(?) or text LIKE(?)", "%#{@input}%", "%#{@input}%").order("created_at desc").page(params[:page]).per(24)
    elsif params[:material] != nil
      @input = params[:material]
      material = Foodstuff.where("material LIKE(?)", "%#{@input}%")
      food_id = material.map{ |m| m.food_id}.uniq
      @foods = Food.where(id: food_id).order("created_at desc").page(params[:page]).per(24)
    elsif params[:order] == "1"
      @input = "最新順のレシピ"
      @foods = Food.all.order("created_at desc").page(params[:page]).per(24)
    elsif params[:order] == "2"
      @input = "いいねが多い順"
      @foods = Food.all.order("goods_count desc").page(params[:page]).per(24)
    elsif params[:order] == "3"
      @input = "ランダムで"
      @foods = Food.all.order("RAND()").page(params[:page]).per(24)
    else
      @input == ""
      @foods = Food.all.page(params[:page]).per(24)
    end
  end

  def more
    if params[:category] != ""
      @category = params[:category]
      @foods = Food.where(category_id: @category).order("created_at desc").page(params[:page]).per(24)
    else
      @category = "全て"
      @foods = Food.all.page(params[:page]).per(24)
    end
  end

  def set_food
    @food = Food.find(params[:id])
  end

  private

  def food_params
    params.require(:food).permit(:food_name, :image, :text, :category_id, :servings, :advice,
                                [foodstuffs_attributes: [:id, :material, :amount]],
                                [recipes_attributes: [:id ,:process]]).merge(user_id: current_user.id)
  end

end