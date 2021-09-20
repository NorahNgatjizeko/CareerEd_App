class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :website
      t.string :job_type
      t.string :location
      t.string :company_name
      t.string :remote_ok

      t.timestamps
    end
  end
end
