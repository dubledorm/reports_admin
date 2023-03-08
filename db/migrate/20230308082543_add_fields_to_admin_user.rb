class AddFieldsToAdminUser < ActiveRecord::Migration[6.0]
  def change
    add_column :admin_users, :users_admin, :boolean
    add_column :admin_users, :reports_admin, :boolean
  end
end
