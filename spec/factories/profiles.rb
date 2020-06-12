FactoryBot.define do
  factory :profile do
    first_name {'Indrajit'}
    last_name {'Naiya'}
    user_id { 1 }

    trait :missing_profile_first_name do
      first_name {}
    end

    trait :empty_string_as_profile_first_name do
      first_name { '' }
    end

    trait :invalidate_profile_first_name_with_special_characters do
      first_name { '@#$%' }
    end

    trait :missing_profile_last_name do
      last_name {}
    end

    trait :empty_string_as_profile_last_name do
      last_name { '' }
    end

    trait :invalidate_profile_last_name_with_special_characters do
      last_name { '@#$%^' }
    end
    
  end
end
