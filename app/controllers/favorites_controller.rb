class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(job_id: params[:job_id])
    favorite.save
    flash[:success] = "Applied Job"
    redirect_to favorite.job, notice:'Applied Job'
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy　
    favorite.destroy
    redirect_to jobs_path
  end
end
