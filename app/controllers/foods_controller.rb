class FoodsController < ApplicationController

  def index
    @foods_1 = Food.order("RAND()").limit(3)
    @foods_2 = Food.order("RAND()").limit(3).where.not(id: @foods_1.map{|f| f.id})
    @foods_3 = Food.order("RAND()").limit(3).where.not(id: @foods_1.map{|f| f.id}).where.not(id: @foods_2.map{|f| f.id})
    @ja_foods = Food.where(category_id: "和食").limit(3).order("created_at desc")
    @we_foods = Food.where(category_id: "洋食").limit(3).order("created_at desc")
    @side_foods = Food.where(category_id: "おかず").limit(3).order("created_at desc")
  end

  def new
    @food = Food.new
    @food.foodstuffs.build
    @food.recipes.build
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to new_after_path
    else
      render action: :new
    end
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
      redirect_to update_after_path
    else
      render action: :edit
    end
  end

  def show
    @food = Food.find(params[:id])
    @foodstuffs = Foodstuff.where(food_id: params[:id])
    @recipes = Recipe.where(food_id: params[:id])
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
  end

  def mypage
    @foods = Food.where(user_id: current_user.id).order("created_at desc")
  end

  def search
    if params[:search] != nil
      @input = params[:search]
      @foods = Food.where("food_name LIKE(?) or text LIKE(?)", "%#{@input}%", "%#{@input}%").order("created_at desc")
    elsif params[:material] != nil
      @input = params[:material]
      material = Foodstuff.where("material LIKE(?)", "%#{@input}%")
      food_id = material.map{ |m| m.food_id}.uniq
      @foods = Food.where(id: food_id).order("created_at desc")
    end
  end

  def more
    if params[:id] == "1"
      @category = "和食"
      @foods = Food.where(category_id: "和食").order("created_at desc")
    elsif params[:id] == "2"
      @category = "洋食"
      @foods = Food.where(category_id: "洋食").order("created_at desc")
    elsif params[:id] == "5"
      @category = "おかず"
      @foods = Food.where(category_id: "おかず").order("created_at desc")
    end
  end

  private

  def food_params
    params.require(:food).permit(:food_name, :image, :text, :category_id, :servings, :advice,
                                [foodstuffs_attributes: [:id, :material, :amount]],
                                [recipes_attributes: [:id ,:process]]).merge(user_id: current_user.id)
  end
end