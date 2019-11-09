class GoodController < ApplicationController
  def create
    @good = Good.create(user_id: current_user.id, food_id: params[:food_id])
    @goods = Good.where(food_id: params[:food_id])
    @food = Food.find(params[:food_id])
  end

  def destroy
    good = Good.find_by(user_id: current_user.id, food_id: params[:food_id])
    good.destroy
    @goods = Good.where(food_id: params[:food_id])
    @food = Food.find(params[:food_id])
  end
end