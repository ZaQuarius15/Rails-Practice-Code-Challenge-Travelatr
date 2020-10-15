class PostsController < ApplicationController

    def like
        @post = Post.find(params[:id])
        @post.add_like
        render :show
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def create 
        @post = Post.new(post_params)
        if @post.save
            redirect_to post_path(@post)
        else 
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        if @post.save
            redirect_to post_path(@post)
        else  
            render :edit
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end

end