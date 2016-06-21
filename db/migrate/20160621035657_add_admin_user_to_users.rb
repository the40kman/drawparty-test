class AddAdminUserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin_user, :bool
  end
end
