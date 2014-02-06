class AlbumsController < ApplicationController
  def show
  end

  def new
  	@albums = Albums.new
  end

  def create
    Albums.create(album_params)      
  end

  private

  def album_params
    params.required(:albums).permit(:title,:image,:genre)
  end
end
