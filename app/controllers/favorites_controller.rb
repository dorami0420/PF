class FavoritesController < ApplicationController
  def create
    stray_cat = StrayCat.find(params[:stray_cat_id])
    favorite = current_user.favorites.new(stray_cat_id: stray_cat.id)
    favorite.save
    redirect_to stray_cats_path(stray_cat)
  end

  def destroy
    stray_cat = StrayCat.find(params[:stray_cat_id])
    favorite = current_user.favorites.find_by(stray_cat_id: stray_cat.id)
    favorite.destroy
    redirect_to stray_cats_path(stray_cat)
  end
end
