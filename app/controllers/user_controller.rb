class UserController < ApplicationController

  def show
    @foods = Food.where(user_id: current_user.id).order("created_at desc")
  end

  def good
    goods = Good.where(user_id: current_user.id)
    @foods = Food.where(id: goods.map{|g| g.food_id}).order("created_at desc")
  end

end