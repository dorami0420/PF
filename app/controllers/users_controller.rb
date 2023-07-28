class UsersController < ApplicationController
before_action :is_matching_login_user, only: [:edit, :update]
 before_action :authenticate_user!, except: [:top, :about]

  def show
    @user = User.find(params[:id])
    @stray_cats = @user.stray_cats.page(params[:page])
    @protective_cats = @user.protective_cats.page(params[:page])

    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
      @msg ="他のユーザーとDMしてみよう！"
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
    end
  end
    if @isRoom != true
        @room = Room.new
        @entry = Entry.new
    end

    end
  end
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

