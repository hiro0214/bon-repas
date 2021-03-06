class UserController < ApplicationController

  before_action :authenticate_user!

  def show
    @foods = Food.where(user_id: current_user.id).order("created_at desc").page(params[:page]).per(10)
  end

  def good
    goods = Good.where(user_id: current_user.id)
    @foods = Food.where(id: goods.map{|g| g.food_id}).order("created_at desc").page(params[:page]).per(10)
  end

end