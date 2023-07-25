class UsersController < ApplicationController
before_action :is_matching_login_user, only: [:edit, :update]
 before_action :authenticate_user!, except: [:top, :about]

  def show
    @user = current_user
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
  if @user = current_user
  @user.update(user_params)
  redirect_to user_path(@user.id)
  else
          render :edit
  end
  end

  private

  def user_params
      params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email, :profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path
    end
  end
end
