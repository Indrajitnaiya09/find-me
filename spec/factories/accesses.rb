FactoryBot.define do
  factory :access do
    share_type { "Public" }

    trait :missing_access_type do
      share_type {}
    end

    trait :empty_string_as_access_type do
      share_type { '' }
    end

    trait :invalidate_access_type_with_special_characters do
      share_type { '@#$%' }
    end
  end
end
