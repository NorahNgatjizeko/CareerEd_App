class EmploymentsController < ApplicationController
  def index
    @employments=Employment.all
  end
  def create
    employment = current_user.employments.create(job_id: params[:job_id])
    redirect_to jobs_url, notice: "#{employment.job.user.name}'s jobs has been applied"
  end
  def destroy
    employment = current_user.employments.find_by(id: params[:id]).destroy
    redirect_to jobs_url, notice: "#{employment.job.user.name}'s jobs has been revoked"
  end
end
