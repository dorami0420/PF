class ProtectiveCatsController < ApplicationController
  def new
    @protective_cat = ProtectiveCat.new
  end

  def create
    @protective_cat = ProtectiveCat.new(protective_cat_params)
    @protective_cat.user_id = current_user.id
  if @protective_cat.save
    redirect_to protective_cat_path
  else
      render :new
  end

  end

  def index
   @protective_cats = ProtectiveCat.page(params[:page])

  end


  def show
    @protective_cat = ProtectiveCat.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    protective_cat = ProtectiveCats.find(params[:id])
    protective_cat.destroy
    redirect_to protective_cats_path
  end


 private

  def protective_cat_params
    params.require(:protective_cat).permit(:name, :image, :caption, :neuter, :color, :place, :gender, :health)
  end

end
