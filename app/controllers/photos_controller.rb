class PhotosController < ApplicationController

before_action :authenticate_user! 

  def create
    @place = Place.find(params[:place_id])
    if @place.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end
    
    @place.photos.create(photos_params)
    redirect_to place_path(@place)
  end

  private

  def photos_params
    params.require(:photo).permit(:caption, :picture)
  end

end
