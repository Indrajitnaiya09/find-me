FactoryBot.define do
  factory :location do
    latitude { "78.0001" }
    longitude { "98.0000" }
    user_id { 1 }
    access_id { 1 }
    address_id { 1 }
  end
end
