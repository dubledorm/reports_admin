ActiveAdmin.register Report do

  permit_params :name, :description, :enabled, :alert_interval_min, :report_string, :transport_string
  menu parent: I18n.t('main_menu.admin')

  filter :name
  filter :enabled
end
