class PostCommentsController < ApplicationController
  def create
    stray_cat = StrayCat.find(params[:stray_cat_id])
    comment = current_user.post_comments.new(stray_cat_params)
    comment.stray_cat_id = stray_cat.id
    comment.save
   redirect_to stray_cat_path(stray_cat)
  end

  def destroy
    stray_cat = StrayCat.find(params[:stray_cat_id])
    PostComment.find(params[:id]).destroy
    redirect_to stray_cat_path(stray_cat.id)
  end

  private

  def stray_cat_params
    params.require(:post_comment).permit(:comment)
  end
end
