# frozen_string_literal: true

# Таблица результатов выполнения
class ReportExecution < ApplicationRecord
  RS_RUNNING = 1
  RS_FINISHED = 2
  RS_ERROR = -1
  SS_WAITING = 0
  SS_RUNNING = 1
  SS_FINISHED = 2
  SS_ERROR = -1
  SS_FINISHED_WITH_ERROR = -2
  REPORT_STATUS_VALUES = { RS_RUNNING => 'running', RS_FINISHED => 'finished', RS_ERROR => 'error' }.freeze
  SEND_STATUS_VALUES = { SS_WAITING => 'waiting', SS_RUNNING => 'running', SS_FINISHED => 'finished',
                         SS_ERROR => 'error', SS_FINISHED_WITH_ERROR => 'finished_with_error' }.freeze

  belongs_to :report
  has_many :report_files, dependent: :destroy

  validates :report_status, presence: true, inclusion: { in: REPORT_STATUS_VALUES.keys }
  validates :send_status, presence: true, inclusion: { in: SEND_STATUS_VALUES.keys }
  validates :send_attempts, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
