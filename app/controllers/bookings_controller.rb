class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @product = Product.find(params[:product_id])
    @diff = calculate_age(@booking.end_date, @booking.date)
  end


  def create
    @booking = Booking.new(booking_params)
    @product = Product.find(params[:product_id])
    @booking.product = @product
    @booking.user = current_user
    @booking.save
    redirect_to user_path(current_user)
  end

  private


  # ADD THIS AS A METHOD IN THE MODEL ISTEAD OF CONTROLLER
  def calculate_age(end_date,date)
    return (end_date - date).to_i.abs
  end

  def booking_params
    params.require(:booking).permit(:status, :date, :end_date)
  end
end
