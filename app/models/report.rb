# frozen_string_literal: true

# Таблица конфигурации отчётов
class Report < ApplicationRecord

  has_many :report_executions, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :alert_interval_min, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :active_reports, -> { where(enabled: true) }
  scope :failure_reports, lambda {
    Report.joins('LEFT OUTER JOIN report_executions AS re ON re.report_id = reports.id ' \
                   'AND (re.report_status IN(-1) OR (re.send_status IN(-1)))')
          .joins('LEFT OUTER JOIN report_executions AS last_re ON last_re.report_id = reports.id' \
' AND (last_re.report_status = 2 OR last_re.send_status = 2)' \
' AND (last_re.report_run_date + make_interval(mins => reports.alert_interval_min) > current_timestamp)')
          .where('last_re.id is NULL OR re.id is not NULL')
  }
  # select last_re.id, re.id, r.* from reports r
  # LEFT OUTER JOIN report_executions AS re ON re.report_id = r.id
  # AND (re.report_status IN(-1) OR (re.send_status IN(-1)))
  # LEFT OUTER JOIN report_executions AS last_re ON last_re.report_id = r.id AND
  # (last_re.report_status = 2 OR last_re.send_status = 2) AND
  # (last_re.report_run_date + interval '15 minutes' > current_timestamp)
  # where last_re.id is NULL OR re.id is not NULL;

  # select DISTINCT r.* from reports r
  # LEFT OUTER JOIN report_executions AS re ON re.report_id = r.id
  # AND (re.report_status IN(-1) OR (re.send_status IN(-1)))
  # LEFT OUTER JOIN report_executions AS last_re ON last_re.report_id = r.id AND
  # (last_re.report_status = 2 OR last_re.send_status = 2) AND
  # (last_re.report_run_date + interval '25 minutes' > current_timestamp)
  # where last_re.id is NULL OR re.id is not NULL;

  # select last_re.id, re.id, r.* from reports r
  # LEFT OUTER JOIN report_executions AS re ON re.report_id = r.id
  # AND (re.report_status IN(-1) OR (re.send_status IN(-1)))
  # LEFT OUTER JOIN report_executions AS last_re ON last_re.report_id = r.id AND
  # (last_re.report_status = 2 OR last_re.send_status = 2) AND
  # (last_re.report_run_date + make_interval(mins => cast(r.alert_interval AS int)) > current_timestamp)
  # where last_re.id is NULL OR re.id is not NULL;
end
