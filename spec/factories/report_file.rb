FactoryGirl.define do
  factory :report_file, class: ReportFile do
    report_execution
    sequence(:file_id) { |n| n }
    sequence(:file_name) { |n| "file_name#{n}" }
    sequence(:file_path) { |n| "file_path#{n}" }
  end
end
