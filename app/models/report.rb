# frozen_string_literal: true

# Таблица конфигурации отчётов
class Report < ApplicationRecord

  has_many :report_executions, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
end
