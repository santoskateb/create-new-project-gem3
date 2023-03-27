class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    #debugger
    #post = Post.new(params[:post])
    #post = Post.new(params[:post].permit(:title, :content))
    #if post.save
    #@post = Post.new(params[:post].permit(:title, :content))
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  #def show @post = Post.find(params[:id]) end
  def show
  end

  #def edit @post = Post.find(params[:id]) end
  def edit
  end

  def update
    #@post = Post.find(params[:id])
    #if @post.update(params.require(:post).permit(:title, :content))
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    #@post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, category_ids: [])
  end
end
