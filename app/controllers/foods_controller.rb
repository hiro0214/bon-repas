class FoodsController < ApplicationController

  def index
    @foods = Food.limit(3).order("created_at desc")
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
    @user = User.find(current_user.id)
    @foods = Food.where(user_id: current_user.id)
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

  private

  def food_params
    params.require(:food).permit(:food_name, :image, :text, :category_id,
                                [foodstuffs_attributes: [:id, :material, :amount]],
                                [recipes_attributes: [:id ,:process]]).merge(user_id: current_user.id)
  end
end