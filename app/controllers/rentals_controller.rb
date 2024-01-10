class RentalsController < ApplicationController
  before_action :set_restaurant, only: %i[new create]

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.restaurant = @restaurant
    @rental.user = current_user
    @rental.status = "pending"
    if @rental.save
      redirect_to restaurants_path
    else
      render :new
    end
  end

  def accept
    # find rental by id
    @rental = Rental.find(params[:id])
    # update status to accepted
    @rental.status = "accepted"
    if @rental.save
      flash[:notice] = "Reservation accepted"
      redirect_to profile_path
    end
  end

  def decline
    # find rental by id
    @rental = Rental.find(params[:id])
    # update status to accepted
    @rental.status = "declined"
    if @rental.save
      flash[:notice] = "Reservation declined"
      redirect_to profile_path
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def rental_params
    params.require(:rental).permit(:reservation_date)
  end
end
