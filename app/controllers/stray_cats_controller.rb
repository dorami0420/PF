class StrayCatsController < ApplicationController
  
  def new
    @stray_cat = StrayCat.new
  end

  def index
    #@stray_cats = StrayCat.page(params[:page])
    @q =  StrayCat.ransack(params[:q])
    @stray_cats = @q.result(distinct: true).includes(:user).page(params[:page]).order("created_at desc")
    #byebug
  end
  
  def create
    @stray_cat = StrayCat.new(stray_cat_params)
    @stray_cat.user_id = current_user.id
    if @stray_cat.save
    redirect_to stray_cats_path
    else
      render :new
    end
  end

  def show
    @stray_cat = StrayCat.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    stray_cat = StrayCat.find(params[:id])
    stray_cat.destroy
    redirect_to  stray_cats_path
  end


 private

  def stray_cat_params
    params.require(:stray_cat).permit(:image, :caption, :color, :place)
  end

end