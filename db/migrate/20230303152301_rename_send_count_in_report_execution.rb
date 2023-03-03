class RenameSendCountInReportExecution < ActiveRecord::Migration[6.0]
  def change
    rename_column :report_executions, :send_count, :send_attempts
  end
end
