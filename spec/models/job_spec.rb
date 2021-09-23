require 'rails_helper'

RSpec.describe 'Job model function', type: :model do

      describe 'Validation test' do

  	    context 'If the job Title is empty' do
  			it 'It is hard to Validation' do
  				job = Job.new(title: '', description: 'Failure test')
  				expect(job).not_to be_valid
  			end
  	    end
  	    context 'If the job description are empty' do
  			it 'Validation is not pass' do
  				job = Job.new(title: 'job', description: '')
  				expect(job).not_to be_valid
  			end
  	    end
  	    context 'If the job Title and details are described' do
  			it 'Validation passes' do
          @user = FactoryBot.create(:user)
  				job = Job.new(title: "job", description: "Failure test", website: "www.con", job_type: "Part-time", location: "Namibia", company_name: "Namcorp", user: @user)
  				expect(job).to be_valid
  			end
  	    end
      end
  end
