class AddAdminGuestToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :admin_guest, :boolean
  end
end
