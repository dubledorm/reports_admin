# frozen_string_literal: true

# Таблица результатов выполнения
class ReportFile < ApplicationRecord

  belongs_to :report_execution

  validates :file_id, presence: true
end
