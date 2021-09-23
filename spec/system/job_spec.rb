require 'rails_helper'
RSpec.describe 'Job', type: :system do
  describe 'New creation function' do
   before do
     @user = FactoryBot.create(:user)
     @admin = FactoryBot.create(:admin)
     visit new_user_session_path
   end
   context 'When creating a new job' do
     it 'The created job is displayed' do
       fill_in 'Email', with: @admin.email
       fill_in 'Password', with: @admin.password
       click_button "Log in"

       visit new_job_path
       fill_in 'Title', with: 'Title'
       fill_in 'Description', with: 'Description'
       click_button "Create Job"
       expect(page).to have_content 'The job was successfully created'
     end
   end
 end
 describe 'List display function' do
   before do
     @user = FactoryBot.create(:user2)
     @admin = FactoryBot.create(:admin)
     visit new_user_session_path
   end
   context 'When transitioning to the list screen' do
     it 'The created job list is displayed' do
       fill_in 'Email', with: @user.email
       fill_in 'Password', with: @user.password
       click_button "Log in"
       job = FactoryBot.create(:job, title: 'job', description: "example2")
       visit jobs_path
       expect(page).to have_content 'job'
     end
   end
 end
 describe 'Detailed display function' do
   before do
     @user = FactoryBot.create(:user3)
     @admin = FactoryBot.create(:admin)
     visit new_user_session_path
   end
   context 'When transitioned to any job details screen' do
     it 'The content of the relevant job is displayed' do
       fill_in 'Email', with: @admin.email
       fill_in 'Password', with: @admin.password
       click_button "Log in"
       job = FactoryBot.create(:job, title: 'job2', description: "example2")
       visit jobs_path(job.id)
       expect(page).to have_content 'job2'
     end
   end
 end
end
