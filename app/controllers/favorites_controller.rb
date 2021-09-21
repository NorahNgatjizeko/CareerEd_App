class FavoritesController < ApplicationController
  def create
    @job = Job.find(params[:job_id])　
    favorite = @job.favorites.new(user_id: current_user.id)　
    favorite.save
    flash[:success] = "Applied Job"
    redirect_to request.referer
  end

  def destroy
    @job = Job.find(params[:job_id])　
    favorite = current_user.favorites.find_by(job_id: @job.id)　②
    favorite.destroy
    redirect_to request.referer
  end
end
