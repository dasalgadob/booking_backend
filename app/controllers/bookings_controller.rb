class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :destroy]
  has_scope :booking_date


  # GET /bookings
  def index
    @bookings = apply_scopes(Booking).all

    render json: @bookings
  end

  # GET /bookings/1
  def show
    render json: @booking
  end

  # POST /bookings
  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      render json: @booking, status: :created, location: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bookings/1
  def update
    if @booking.update(booking_params)
      render json: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bookings/1
  def destroy
    @booking.destroy
  end

  # GET /bookings/count/
  def count
    Booking.where(movie_id: :movie_id, booking_date: :booking_date)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def booking_params
      params.require(:booking).permit(:movie_id, :id_card, :email, :name, :phone, :booking_date)
    end
end
