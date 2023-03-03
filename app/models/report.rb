# frozen_string_literal: true

# Таблица конфигурации отчётов
class Report < ApplicationRecord

  has_many :report_executions, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :alert_interval, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
