FactoryBot.define do
  factory :school do
    name { Faker::Educator.unique.secondary_school } # Generates a unique school name
    address { Faker::Address.full_address }
    school_admin_id { FactoryBot.create(:user, :school_admin).id }
  end
end
