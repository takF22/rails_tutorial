class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:show,:new, :create]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  def index
    if session[:search].blank?
    @q = Blog.ransack(params[:q])
    result = @q.result
    @blogs = result.includes(:user).page(params[:page]).per(10).order(updated_at: "desc")
    else
    session[:search] = params[:q]
    end
  end

  def new
    @blog = Blog.new(
      user_id: current_user.id
    )
  end

  def create
    @blog = Blog.new(blog_new_params)
    if @blog.save
      # indexアクションへオプション(一時的なメッセージ)付きでリダイレクト
      flash[:success] = "記事を投稿しました"
      redirect_to blogs_path
    else
      # flash.now[:danger] = '記事の登録に失敗しました'
      # newページに行け
      render :new
    end
  end

  def show
    @blog = Blog.includes(:user).find(params[:id])
    # @comments = Comment.where(blog_id: @blog.id).includes(:user).page(params[:page]).per(5).order(created_at: "desc")
    @comments = Comment.joins(:blog)
      .includes(:blog)
      .where(blog_id: @blog.id)
      .includes(:user)
      .page(params[:page])
      .per(5).
      order(created_at: "desc")
    # @blog = Blog.find(params[:id])
    # @comments = @blog.comments.page(params[:page]).per(5).order(created_at: "desc")
    @comment = Comment.new
    # session[:search] = params[:q]
    # binding.pry
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    #permitted_params = params.require(:blog).permit(:id, :title, :content)
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      # showアクションへオプション(一時的なメッセージ)付きでリダイレクト
      flash[:success] = "記事を編集しました"
      redirect_to blogs_path
    else
      flash.now[:danger] = '変更の登録に失敗しました'
      #editページに行け
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:success] = "削除しました"
    redirect_to blogs_path
  end

  #記事編集時に格納するパラメータ
  private
  def blog_params
    params.require(:blog).permit(:title, :content, :id, :user_id, :img, :remove_img)
  end
  #記事投稿時に格納するパラメータ
  def blog_new_params
    params.require(:blog).permit(:title, :content, :id, :img, :remove_img, :user_id)
  end
  #投稿者のみが削除・編集できるようにする
  def ensure_correct_user
    @blog = Blog.find_by(id:params[:id])
    if @blog.user_id.to_i != current_user.id
     # binding.pry
      flash[:danger] = "権限がありません"
      redirect_to blogs_path
    end
  end

  def blogs_path_with_search_params
    URI(request.referer).path == '/blogs' ? request.referer : blogs_path
  end

end
