class MainController < ApplicationController

	def index
		@albums = Album.all
		@tracks = Track.all
	end

	def new
		@albums = Album.new
	end

	def create
		@post = Album.new(params[:post].permit(:title, :text))

		if @post.save
		    redirect_to @post
		else
		    render 'new'
		end
	end

	def show
		@post = Album.find(params[:id])
	end

end
