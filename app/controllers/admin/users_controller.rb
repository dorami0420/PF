class Admin::UsersController < ApplicationController
   layout 'admin'
def index
   @users = User.all

end

# def edit
#   @customer = Customer.find(params[:id])
# end

def show
  @user = User.find(params[:id])

end

def update
  @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "You have updated user successfully."
          redirect_to admin_users_path
      else
          render :edit
      end
end

private

def user_params
  params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number)
end


end
