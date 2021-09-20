json.extract! job, :id, :company_name, :title, :description, :website, :job_type, :location, :remote_ok, :created_at, :updated_at
json.url job_url(job, format: :json)
