ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :reports_admin, :users_admin

  menu parent: I18n.t('main_menu.admin')

  index do
    selectable_column
    id_column
    column :email
    column :users_admin
    column :reports_admin
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :users_admin
  filter :reports_admin
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :users_admin
      f.input :reports_admin
    end
    f.actions
  end

end
