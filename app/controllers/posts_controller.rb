class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.ordered
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

  def order
    params[:post].each_with_index do |id, index|
      Post.find(id).update(position: index)
    end
  end

  private

    def set_post
      @post = Post.find params[:id]
    end

    def post_params
      params.require(:post).permit(:name)
    end
end
