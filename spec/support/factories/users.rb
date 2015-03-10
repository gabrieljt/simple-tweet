FactoryGirl.define do
  factory :user do
    username  { Forgery('name').full_name }
    password  { Forgery('basic').text }
  end
end
