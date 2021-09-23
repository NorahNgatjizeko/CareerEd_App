class Users::SessionsController < Devise::SessionsController
  def new_guest
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'You have logged in as a guest user.'
  end
  def admin_guest
      guest_user = User.admin_guest
      sign_in guest_user
      redirect_to root_path, notice: 'You have logged in as an admin guest user.'
    end
end
