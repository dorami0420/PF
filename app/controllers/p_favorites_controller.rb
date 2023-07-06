class PFavoritesController < ApplicationController
  def create
    protective_cat = ProtectiveCat.find(params[:protective_cat_id])
    favorite = current_user.favorites.new(protective_cat_id: protective_cat.id)
    favorite.save
    redirect_to protective_cat_path(protective_cat)
  end

  def destroy
    protective_cat = ProtectiveCat.find(params[:protective_cat_id])
    favorite = current_user.favorites.find_by(protective_cat_id: protective_cat.id)
    favorite.destroy
    redirect_to protective_cat_path(:protective_cat_cat)
  end

end
