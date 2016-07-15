FactoryGirl.define do
  factory :user, aliases: [:author, :assigned_user] do
    first_name
    last_name
    email
    password
    confirmation_token { generate :token }

    trait :manager do
      role :manager
    end

    trait :worker do
      role :worker
    end
  end
end
