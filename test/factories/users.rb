FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.unique.email }
    password = Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true)
    password { password }
    encrypted_password { password }
  end

  factory :admin, class: Admin, parent: :user do
    type { 'Admin' }
  end

  factory :student, class: Student, parent: :user do
    type { 'Student' }
  end

  factory :school_admin, class: SchoolAdmin, parent: :user do
    type { 'SchoolAdmin' }
  end
end
