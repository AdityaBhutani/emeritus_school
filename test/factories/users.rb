FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    created_at { Faker::Time.between(from: 2.days.ago, to: Time.now, format: :default) }
    updated_at { Faker::Time.between(from: 1.day.ago, to: Time.now, format: :default) }
    email { Faker::Internet.unique.email }
    password = Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true)
    password { password }
    encrypted_password { password }
  end

  trait :admin do
    type { 'Admin' }
  end

  trait :school_admin do
    type { 'SchoolAdmin' }
  end

  trait :student do
    type { 'Student' }
  end
end
