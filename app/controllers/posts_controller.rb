class PostsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]

def index
  @posts = Post.all
end

def show
  set_params
end

def new
  @post = Post.new
end

def edit
  set_params
end

def create
  @post = Post.new(post_params(:title, :description))
  @post.save
  redirect_to post_path(@post)
end

def update
  set_params
  @post.update(post_params(:title))
  redirect_to post_path(@post)
end

def destroy
  set_params
  @post.destroy
  redirect_to posts_path
end

private

def post_params(*args)
  params.require(:post).permit(*args)
end

def set_params
  @post = Post.find(params[:id])
end

end
