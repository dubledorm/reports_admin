FactoryGirl.define do
  factory :report, class: Report do
    sequence(:name) { |n| "name#{n}" }
    sequence(:description) { |n| "description#{n}" }
  end
end
