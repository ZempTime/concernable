class Posts::FilingsController < ApplicationController
  def file
    @post = Post.find(params[:id])
    @target_post = Post.find(params[:target_id])

    @post.file(@target_post)
  end
end
