FactoryGirl.define do
  factory :report_execution, class: ReportExecution do
    report
    report_status 2
    report_run_date Time.now - 10.minutes
    report_end_date Time.now - 5.minutes
    send_status 0
    send_attempts 0
  end
end
