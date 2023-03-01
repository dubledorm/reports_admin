class CreateReportFile < ActiveRecord::Migration[6.0]
  def change
    create_table :report_files do |t|
      t.references :report_execution, null: false, foreign_key: true
      t.string :file_id
      t.string :file_name
      t.string :file_path
    end

    add_index :report_files, :file_id
  end
end
