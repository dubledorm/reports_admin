class CreateReportExecution < ActiveRecord::Migration[6.0]
  def change
    create_table :report_executions do |t|
      t.references :report, null: false, foreign_key: true
      t.integer :report_status
      t.datetime :report_run_date
      t.datetime :report_end_date
      t.text :report_error
      t.integer :send_status
      t.datetime :send_run_date
      t.datetime :send_end_date
      t.integer :send_count
      t.text :send_error
    end

    add_index :report_executions, :report_status
    add_index :report_executions, :send_status
    add_index :report_executions, :report_run_date
    add_index :report_executions, :report_end_date
    add_index :report_executions, :send_run_date
    add_index :report_executions, :send_end_date
    add_index :report_executions, :send_count
  end
end
