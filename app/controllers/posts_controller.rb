class PostsController < ApplicationController

	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.most_recent
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

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "文章修改成功"
      redirect_to posts_path
    else
      flash[:alert] = "此文章修改失敗，請檢查"
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "文章被刪除了"
    redirect_to posts_path
  end

	private

	def set_post
		@post = Post.friendly.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body, :description, :image)
	end
end
