class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :accept_decline]

  def index
    @bookings = Booking.all
  end


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

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: "Accepted")
    redirect_to bookings_path
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(status: "Declined")
    redirect_to bookings_path
  end

  private
  
  def set_booking
    @booking = Booking.find(params[:id])

  end

  def booking_params
    params.require(:booking).permit(:status, :date, :end_date)
  end
end
