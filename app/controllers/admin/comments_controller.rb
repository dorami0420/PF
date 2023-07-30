class Admin::CommentsController < ApplicationController
   layout 'admin'
  def index
    @post_comments = PostComment.all
    @p_post_comments = PPostComment.all
  end

  def destroy
    if params[:kind] == "post_comment"
      comment = PostComment.find(params[:id])
    elsif params[:kind] == "p_post_comment"
      comment = PPostComment.find(params[:id])
    else
      comment = nil
    end
    comment.destroy if comment
    redirect_to '/admin/comments'
  end

end
