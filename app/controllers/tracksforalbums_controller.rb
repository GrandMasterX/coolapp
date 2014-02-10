class TracksforalbumsController < ApplicationController

  def show
    @album = Album.find(params[:id])
  end

  def create
    @album = Album.find(params[:id])
    @track = @album.track.create(params[:track])
  end

end
