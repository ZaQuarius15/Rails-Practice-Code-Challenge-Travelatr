class BloggersController < ApplicationController

  def index
    @bloggers = Blogger.all
  end

  def show
    @blogger = Blogger.find(params[:id])
    @post = @blogger.featured_post
  end

  def new
    @blogger = Blogger.new
  end

  def create
    blogger = Blogger.create(bloggers_params)
      if blogger.save
        redirect_to blogger_path(blogger)
      else
        flash[:errors] = blogger.errors.full_messages
        redirect_to new_blogger(blogger)
      end
    end


  def update
    @blogger = Blogger.find(params[:id])
    @blogger.update(bloggers_params)
  end

  private
  def bloggers_params
    params.require(:blogger).permit(:name, :bio, :age)
  end
end