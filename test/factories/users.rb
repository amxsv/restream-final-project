FactoryGirl.define do
  factory :user do
    first_name
    last_name
    email
    password
    confirmation_token { generate :token }
  end
end
