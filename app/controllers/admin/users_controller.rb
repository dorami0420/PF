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



def destroy
    user = User.find(params[:id])  
    user.destroy
    redirect_to '/lists'  
end
  
private

def user_params
  params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number)
end


end
