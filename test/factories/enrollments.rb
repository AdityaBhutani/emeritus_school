FactoryBot.define do
  factory :enrollment do
    status { Enrollment.statuses.keys.sample }
    student_id { FactoryBot.create(:student).id }
    batch_id { FactoryBot.create(:batch).id }
  end
end
