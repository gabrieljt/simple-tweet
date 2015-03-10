FactoryGirl.define do
  factory :user do
    username  { Forgery(:name).full_name }
    password  { Forgery(:basic).password }
  end
end
