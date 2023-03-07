class ChangeAlertIntervalTypeAndName < ActiveRecord::Migration[6.0]
  def change
    remove_column :reports, :alert_interval
    add_column :reports, :alert_interval_min, :integer
  end
end
