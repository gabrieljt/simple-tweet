FactoryGirl.define do
  factory :user do
    username  { Forgery(:name).full_name }
    email  { Forgery(:internet).email_address }
    password  { Forgery(:basic).password }
  end
end
