class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(params[:album])
 
    if @album.save
      flash[:notice] = 'Album was successfully created.'
      flash[:color]= "valid"
      redirect_to @album
    else
      flash[:notice] = "Fail when saiving"
      flash[:color]= "invalid"
      render :action => "new" 
    end   

  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
   
    if @album.update(album_params)
      redirect_to @album
    else
      render 'edit'
    end
  end

  #private

  #def album_params
  #  params.require(:album).permit(:title, :genre,)
  #end

end
