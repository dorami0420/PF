class PostCommentsController < ApplicationController
  def create
    stray_cat = PostImage.find(params[:stray_cat_id])
    comment = current_user.stray_cats.new(stray_cat_params)
    comment.stray_cat_id = stray_cat.id
    comment.save
   redirect_to stray_cats_path(stray_cat)
  end

  def destroy
    StrayCat.find(params[:id]).destroy
    redirect_to stray_cat_path(params[:stray_cat_id])
  end

  private

  def stray_cat_params
    params.require(:post_comment).permit(:comment)
  end
end
