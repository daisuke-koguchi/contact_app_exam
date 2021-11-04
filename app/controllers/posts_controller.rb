class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to posts_path, notice: "メモを作成しました！"
    else
      render :new
    end
  end
  def show
  end
  def edit
  end
  def update
      if @post.update(post_params)    
        redirect_to posts_path, notice: "メモを編集しました！"
      else
        render :edit
      end
  end
  def destroy
    @post.destroy
    redirect_to posts_path, notice: "メモを削除しました！"

  end
  private
  def post_params
    params.require(:post).permit(:content)
  end
  def set_post
    @post = Post.find(params[:id])
  end
end
