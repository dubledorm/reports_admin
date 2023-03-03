# frozen_string_literal: true

# Таблица результатов выполнения
class ReportExecution < ApplicationRecord

  REPORT_STATUS_VALUES = { 1 => 'running', 2 => 'finished', -1 => 'error' }.freeze
  SEND_STATUS_VALUES = { 0 => 'waiting', 1 => 'running', 2 => 'finished', -1 => 'error' }.freeze

  belongs_to :report
  has_many :report_files, dependent: :destroy

  validates :report_status, presence: true, inclusion: { in: REPORT_STATUS_VALUES.keys }
  validates :send_status, presence: true, inclusion: { in: SEND_STATUS_VALUES.keys }
  #validates :send_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
