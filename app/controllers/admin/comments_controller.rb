class Admin::CommentsController < ApplicationController
   layout 'admin'
  def index
    @post_comments = PostComment.all
    @p_post_comments = PPostComment.all
  end

  def destroy
    if params[:type] == :post_comment
      comment = PostComment.find(params[:id])
    else
      comment = PPostComment.find(params[:id])
    end
    comment.destroy
    redirect_to '/comments'
  end

end
