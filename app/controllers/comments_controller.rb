class CommentsController < ApplicationController
    def create
        @blog = Blog.find(params[:blog_id])
        @comment = @blog.comments.create(comment_params)
        #@comment.user_id = current_user.id
        if @comment.save
            flash[:success] = "コメントしました"
            redirect_to blog_path(@blog)
        else
            flash[:danger] = "コメントできませんでした"
            redirect_to blog_path(params[:blog_id])
            #render :show/:id(params[:blog_id])
        end
    end

  def destroy
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.find(params[:id])
    @comment.destroy
    flash[:success] = "削除しました"
    redirect_to blog_path(@blog)
  end

    #記事投稿時に格納するパラメータ
  private
  def comment_params
   # binding.pry
    params.require(:comment).permit(:body, :blog_id).merge(user_id: current_user.id.to_i)
  end
end
