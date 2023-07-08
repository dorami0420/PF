class UsersController < ApplicationController
  
  

  def show
    @user = User.find(params[:id])
    @stray_cats = @user.stray_cats.page(params[:page])
    @protective_cats = @user.protective_cats.page(params[:page])
  end

  def edit
      @user = User.find(params[:id])
  unless @user.id == current_user.id
    redirect_to users_path
  end
  end

  def update
     is_matching_login_user
  @user = User.find(params[:id])
  @user.update(user_params)
  redirect_to user_path(@user.id)
  end

  private
  
  def user_params
      params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path
    end
  end    
end
