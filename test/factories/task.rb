FactoryGirl.define do
  factory :task do
    title
    description
    due_date { generate :date }
    author
    assigned_user
  end
end
