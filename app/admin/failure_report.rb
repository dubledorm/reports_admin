ActiveAdmin.register Report, as: "FailureReport" do
  actions :index, :show
  decorate_with ReportDecorator
  menu priority: 1
  filter :name

  controller do
    def scoped_collection
      Report.active_reports.failure_reports
    end
  end

  show do
    attributes_table do
      row :id
      row :name
      row :description
      row :report_end_date
      row :enabled
      row :alert_interval_min
      row :report_string
      row :transport_string
    end

    if failure_report.expired?
      panel I18n.t('warning') do
        I18n.t('expired_alert_interval')
      end
    end

    panel ReportExecution.model_name.human do
      table_for failure_report.failure_attempts do
        column :id
        column :report_status do |attempt|
          attempt.decorate.report_status
        end
        column :report_run_date
        column :report_end_date
        column :report_error
        column :send_status do |attempt|
          attempt.decorate.send_status
        end
        column :send_run_date
        column :send_end_date
        column :send_attempts
        column :send_error
      end
    end
  end
end
