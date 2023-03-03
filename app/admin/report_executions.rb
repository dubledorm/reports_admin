ActiveAdmin.register ReportExecution do

  permit_params :report_id, :report_status, :report_run_date, :report_end_date, :report_error, :send_status,
                :send_run_date, :send_end_date, :send_error, :send_attempts

  decorate_with ReportExecutionDecorator

  #
  # or
  #
  # permit_params do
  #   permitted = [:report_id, :report_status, :report_run_date, :report_end_date, :report_error, :send_status, :send_run_date, :send_end_date, :send_count, :send_error]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
