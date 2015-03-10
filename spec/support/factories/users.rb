FactoryGirl.define do
  factory :user do
    username  { Forgery(:name).full_name }
    password  { Forgery(:basic).password }
    password_confirmation { password }
  end

  factory :invalid_user, parent: :user do
    username  nil
    password  nil
    password_confirmation nil
  end
end
