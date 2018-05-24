class PostsController < ApplicationController

	before_action :set_post, only: [:show]
	
	def index
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:notice] = "文章建立成功"
			redirect_to posts_path
		else
			flash[:alert] = "此文章建立失敗，請檢查"
      render 'new'
    end
	end


	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body, :description)
	end
end
