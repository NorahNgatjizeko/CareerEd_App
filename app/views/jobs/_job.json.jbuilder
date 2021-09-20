json.extract! job, :id, :title, :description, :website, :job_type, :location, :company_name, :remote_ok, :avatar, :created_at, :updated_at
json.url job_url(job, format: :json)
