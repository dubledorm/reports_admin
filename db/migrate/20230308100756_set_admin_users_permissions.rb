class SetAdminUsersPermissions < ActiveRecord::Migration[6.0]
  def up
    AdminUser.update_all(users_admin: true, reports_admin: true)
  end
end
