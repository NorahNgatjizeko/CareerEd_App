require 'rails_helper'
RSpec.describe 'User management function', type: :system do
  describe 'User registration test' do
    context 'When creating a new user' do
      it 'cannot be created without reCAPTCHA' do
        visit new_user_registration_path
        fill_in 'Name', with: 'user'
        fill_in 'Email', with: 'user@dive.l'
        fill_in 'Password', with: 'password'
        fill_in "Password confirmation", with: "password"
        expect{ click_button "Sign up" }.to change(User, :count).by(1)
      end
    end
    context 'When the user tries to jump to the job list screen without logging' do
      it 'Transition to the login screen' do
        visit jobs_path
        expect(page).to have_content 'You need to sign in or sign up before continuing.'
      end
    end
  end
  describe 'Testing session functionality' do
    before do
      @user = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user2)
    end
    context 'When user tries login' do
      it 'Login is a success' do
        visit new_user_session_path
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
        click_button "Log in"
        expect(page).to have_content 'Signed in successfully.'
      end
    end
    context 'to be able to logout' do
      it 'enables logout' do
         end
    end
  end
  describe 'Admin screen test function' do
    before do
      @user = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user2)
      @admin = FactoryBot.create(:admin)
    end
    context 'When admin tries to access admin screen' do
      it 'Admin screen is successfully displayed' do
        visit new_user_session_path
        fill_in 'Email', with: @admin.email
        fill_in 'Password', with: @admin.password
        click_button "Log in"
        expect(page).to have_content 'Signed in successfully.'
      end
    end
    context 'When admin tries to register new user' do
      it 'Admin can register user successfully' do
        visit rails_admin_path
        fill_in 'Email', with: @admin.email
        fill_in 'Password', with: @admin.password
        click_button "Log in"
        visit rails_admin_path
      end
    end
    context 'When admin tries to edit the user' do
      it 'The user edit screen is successfully displayed' do
        visit new_user_session_path
        fill_in 'Email', with: @admin.email
        fill_in 'Password', with: @admin.password
        click_button "Log in"
        visit rails_admin_path(@user.id)
      end
    end
    context 'When admin tries to delete a user' do
      it 'The user is deleted successfully' do
        visit new_user_session_path
        fill_in 'Email', with: @admin.email
        fill_in 'Password', with: @admin.password
        click_button "Log in"
        visit rails_admin_path
        expect(page).to_not have_content @user2.id
      end
    end
  end
end
