FactoryGirl.define do
  factory :report, class: Report do
    sequence(:name) { |n| "name#{n}" }
    sequence(:description) { |n| "description#{n}" }

    alert_interval_min 10
  end
end
