class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /jobs or /jobs.json
  def index
    if(params.has_key?(:job_type))
      @jobs = Job.where(job_type: params[:job_type]).order("created_at desc")
    else
      @jobs = Job.all.order("created_at desc")
    end
    @jobs = if params[:term]
      Job.where('job_type LIKE ?', "%#{params[:term]}%")
    else
      @jobs = Job.all
end
            @search = Job.ransack(params[:q])
            if params[:q]
            @jobs = @search.result
          elsif params[:sort_job_type]
            @jobs = Job.all.order('job_type')
          elsif params[:sort_job_type]
            @jobs=jobs = Job.all.order('job_type DESC')
        end
  end

  # GET /jobs/1 or /jobs/1.json
  def show
    @employment = current_user.employments.find_by(job_id: @job.id)
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs or /jobs.json
  def create
    @job = Job.new(job_params)
    @job.user_id = current_user.id
    if @job.save
      redirect_to jobs_path, notice: "The job was successfully created"
    else
       render :new
    end
  end

  # PATCH/PUT /jobs/1 or /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: "Job was successfully updated." }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1 or /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: "Job was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:title, :description, :website, :job_type, :location, :company_name, :remote_ok, :avatar)
    end
  end
