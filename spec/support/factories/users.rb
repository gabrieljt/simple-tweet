FactoryGirl.define do
  factory :user do
    username  { Forgery(:name).full_name }
    password_digest  { Forgery(:basic).password }
  end
end
