class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
    @album.image = params[:image]
  end

  def create
    @album = Album.new(params[:album])
    @album.image = params[:image]
 
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
   
    if @album.update(params[:album])
      redirect_to @album
    else
      render 'edit'
    end
  end

  def destroy
    @article = Album.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end
  
end
