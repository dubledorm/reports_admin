ActiveAdmin.register Report do

  permit_params :name, :description, :enabled, :alert_interval, :report_string, :transport_string
end
