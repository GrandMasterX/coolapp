class MainController < ApplicationController

	def index
		@albums = Albums.all
	end

	def new
		@albums = Albums.new
	end

	def create
		@post = Albums.new(params[:post].permit(:title, :text))

		if @post.save
		    redirect_to @post
		else
		    render 'new'
		end
	end

	def show
		@post = Albums.find(params[:id])
	end

end
