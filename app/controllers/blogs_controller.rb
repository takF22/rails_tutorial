class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:show,:new, :create]
  def index
    #@blogs = Blog.all.order(created_at: "desc")
    @q = Blog.ransack(params[:q])
    @blogs = @q.result.page(params[:page]).per(10).order(created_at: "desc")
  # @q = Blog.ransack(params[:q])
   # @result = @q.result(distinct: true)
   # if params[:q].present?
   # @search = Blog.ransack(params[:q])
   # @result = @search.result
   # else
   #   @blogs = Blog.all.order(created_at: "desc")
   # end
  end

  #def search
  #  index
  #  render :index
  #end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_new_params)
    #binding.pry
    if @blog.save
    # indexアクションへオプション(一時的なメッセージ)付きでリダイレクト
    flash[:success] = "記事を投稿しました"
    redirect_to blogs_path
    else
      flash.now[:danger] = '記事の登録に失敗しました'
      #newページに行け
      render :new
  end
end

  def show
    @blog = Blog.find(params[:id])
    @user = User.find_by(id: @blog.user_id)
    @comments = @blog.comments.page(params[:page]).per(5).order(created_at: "desc")
    @comment = Comment.new
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
  private
  def blog_new_params
    params.require(:blog).permit(:title, :content, :id, :img, :remove_img).merge(user_id: current_user.id)
  end
  #投稿者のみが削除・編集できるようにする
  def ensure_correct_user
    @blog = Blog.find_by(id:params[:id])
    if @blog.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to blogs_path
  end
end

end
