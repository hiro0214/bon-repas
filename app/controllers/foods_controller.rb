class FoodsController < ApplicationController

  def index
    @foods = Food.limit(4).order("created_at desc")
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(user_id: current_user.id,
                    food_name: food_params[:food_name],
                    image: food_params[:image],
                    text: food_params[:text],
                    material: food_params[:material],
                    category_id: food_params[:category_id])
    if @food.save
      redirect_to new_after_path
    else
      render action: :new
    end
  end

  def show
    @food = Food.find(params[:id])
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
  end

  def mypage
    @user = User.find(current_user.id)
    @foods = Food.where(user_id: current_user.id)
  end

  private

  def food_params
    params.require(:food).permit(:food_name, :image, :text, :material, :category_id)
  end

end
