ActiveAdmin.register ReportFile do

  menu parent: I18n.t('main_menu.views')

  actions :index, :show

  filter :file_id
  filter :file_name
end
