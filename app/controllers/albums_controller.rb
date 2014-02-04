class AlbumsController < ApplicationController
  def show
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
end
