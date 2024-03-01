FactoryBot.define do
  factory :batch do
    name { "Batch #{Faker::Number.unique.number(digits: 4)}" }
    start_date { Faker::Date.backward(days: 365) }
    end_date { Faker::Date.forward(days: 365) }
    course_id { FactoryBot.create(:course).id }
  end
end
