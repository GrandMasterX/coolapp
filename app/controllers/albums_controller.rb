class AlbumsController < ApplicationController
  def show
    @albums = Albums.all
  end

  def new
  end

  def create
    @albums = Albums.new(params[:post])
 
    if @albums.save
      flash[:notice] = 'Album was successfully created.'
      flash[:color]= "valid"
      redirect_to @albums
    else
      flash[:notice] = "Fail when saiving"
      flash[:color]= "invalid"
      render :action => "new" 
    end   

  end

  #private

  #def album_params
  #  params.required(:albums).permit(:title,:image,:genre)
 # end
end
