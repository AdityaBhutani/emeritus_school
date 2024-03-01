FactoryBot.define do
  factory :course do
    name { Faker::Educator.unique.course_name }
    description { Faker::Lorem.paragraph(sentence_count: 5) }
    school_id { FactoryBot.create(:school).id }
  end
end
