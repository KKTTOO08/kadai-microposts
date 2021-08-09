class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @micropost.beokiniiri(current_user)
    flash[:success] = '投稿をお気に入りにしました'
    redirect_to request.referrer || root_url
    
  end

  def destroy
    @micropost = Favorite.find(params[:id]).micropost
    @micropost.benotokiniiri(current_user)
    flash[:success] = '投稿のお気に入りを解除しました'
    redirect_to request.referrer || root_url
  end
end
