class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :accept_decline]

  def index
    @bookings = policy_scope(Booking)
  end


  def new
    @booking = Booking.new
    authorize @booking
    @product = Product.find(params[:product_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @product = Product.find(params[:product_id])
    @booking.product = @product
    @booking.user = current_user
    authorize @booking
    @booking.save
    redirect_to user_path(current_user)
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: "Accepted")
    authorize @booking
    redirect_to bookings_path
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(status: "Declined")
    authorize @Booking
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
