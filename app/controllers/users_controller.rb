class UsersController < ApplicationController

  def show
    @user = current_user
    authorize @user
    @markers = @user.geocoded.map
      {
        lat: @user.latitude,
        lng: @user.longitude
      }
  end
end
