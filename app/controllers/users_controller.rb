class UsersController < ApplicationController
  def show
    @user = current_user
    @restaurant = Restaurant.new
  end
end
