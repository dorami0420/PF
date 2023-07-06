class PPostCommentsController < ApplicationController
  def create
    protective_cat = ProtectiveCat.find(params[:protective_cat_id])
    comment = current_user.protective_cats.new(protective_cat_params)
    comment.protective_cat_id = protective_cat.id
    comment.save
   redirect_to protective_cats_path(protective_cat)
  end

  def destroy
    ProotectiveCat.find(params[:id]).destroy
    redirect_to protective_cat_path(params[:protective_cat_id])
  end

  private

  def protective_cat_params
    params.require(:post_comment).permit(:comment)
  end
end
