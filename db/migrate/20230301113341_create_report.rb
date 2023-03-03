class CreateReport < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :name
      t.text :description
      t.boolean :enabled
      t.string :alert_interval
      t.string :report_string
      t.string :transport_string
    end

    add_index :reports, :enabled
    add_index :reports, :name, unique: true
  end
end
