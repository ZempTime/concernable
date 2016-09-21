class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.new post_params

    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end

  def create
    @post = Post.new post_params

    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end

  def update
    if @post.save post_params
      redirect_to @post
    else
      render "edit"
    end
  end

  def destroy
  end

  private

    def set_post
      @post = Post.find params[:id]
    end

    def post_params
      params.require(:post).permit(:name)
    end
end
