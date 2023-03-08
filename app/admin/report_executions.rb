ActiveAdmin.register ReportExecution do
  actions :index, :show
  menu parent: I18n.t('main_menu.views')
  decorate_with ReportExecutionDecorator

  filter :report
  filter :report_status, as: :check_boxes,
                         collection: proc {
                                       ReportExecution::REPORT_STATUS_VALUES.keys.map do |item|
                                         [I18n.t("report_execution.report_status.#{(ReportExecution::REPORT_STATUS_VALUES[item]).to_s}"), item]
                                       end
                                     }
  filter :report_run_date
  filter :report_error
  filter :send_status, as: :check_boxes,
                       collection: proc {
                                     ReportExecution::SEND_STATUS_VALUES.keys.map do |item|
                                       [I18n.t("report_execution.send_status.#{(ReportExecution::SEND_STATUS_VALUES[item]).to_s}"), item]
                                     end
                                   }
  filter :send_attempts
  filter :send_error

  index do
    selectable_column
    column :report
    column :report_status
    column :report_run_date
    column :report_error
    column :send_status
    column :send_attempts
    column :send_error
    actions
  end


  show do
    attributes_table do
      row :id
      row :report_id
      row :report_status
      row :report_run_date
      row :report_end_date
      row :report_error
      row :send_status
      row :send_run_date
      row :send_end_date
      row :send_attempts
      row :send_error
    end

    panel ReportFile.model_name.human do
      table_for report_execution.report_files do
        column :file_id
        column :file_name
        column :file_path
      end
    end
  end

  member_action :stop_send, method: :post do
    resource.update!(send_status: ReportExecution::SS_FINISHED_WITH_ERROR)
    redirect_to admin_failure_report_path(id: resource.report_id), notice: I18n.t('send_stoped_success')
  end
end
