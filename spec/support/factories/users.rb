FactoryGirl.define do
  factory :user do
    username  { Forgery(:name).full_name }
    password  { Forgery(:basic).password }
    password_confirmation { password }
  end
end
