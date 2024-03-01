FactoryBot.define do
  factory :school do
    name { Faker::Name.first_name }
    address { Faker::Address.full_address }
    school_admin_id { FactoryBot.create(:school_admin).id }
  end
end
