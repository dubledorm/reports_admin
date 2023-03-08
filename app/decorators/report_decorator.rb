# frozen_string_literal: true

# Декоратор для report
class ReportDecorator < Draper::Decorator
  delegate_all

  decorates_association :report_executions

  def failure_attempts
    object.report_executions.where("report_status = #{ReportExecution::RS_ERROR} OR send_status = #{ReportExecution::SS_ERROR}")
  end

  def expired?
    object.report_executions.where("(report_executions.report_status = #{ReportExecution::RS_FINISHED}" \
"OR report_executions.send_status = #{ReportExecution::SS_FINISHED})" \
' AND (report_executions.report_run_date + make_interval(mins => :alert_interval_min) > current_timestamp)',
                                   { alert_interval_min: object.alert_interval_min }).empty?
  end
end
