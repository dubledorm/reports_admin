# frozen_string_literal: true

# Декоратор для report_execution
class ReportExecutionDecorator < Draper::Decorator
  delegate_all

  DEFAULT_STATUS_VALUE = 'undefined'

  def report_status
    I18n.t("report_execution.report_status.#{ReportExecution::REPORT_STATUS_VALUES[object.report_status] ||
      DEFAULT_STATUS_VALUE}")
  end

  def send_status
    I18n.t("report_execution.send_status.#{ReportExecution::SEND_STATUS_VALUES[object.send_status] ||
      DEFAULT_STATUS_VALUE}")
  end
end
