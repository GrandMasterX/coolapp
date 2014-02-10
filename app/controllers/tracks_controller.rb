class TracksController < ApplicationController
  
  def index
    @tracks = Track.all
  end

  def show
  	@track = Track.find(params[:id])
  end

  def new
    @track = Track.new
    @track.cover = params[:cover]
    @track.file = params[:file]
  end

  def create
    @track = Track.new(params[:track])
    @track.cover = params[:cover]
    @track.file = params[:file]
 
    if @track.save
      flash[:notice] = 'Album was successfully created.'
      flash[:color]= "valid"
      redirect_to @track
    else
      flash[:notice] = "Fail when saiving"
      flash[:color]= "invalid"
      render :action => "new" 
    end   

  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
   
    if @track.update(params[:track])
      redirect_to @track
    else
      render 'edit'
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
 
    redirect_to tracks_path
  end

end
