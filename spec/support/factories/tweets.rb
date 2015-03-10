FactoryGirl.define do
  factory :tweet do
    user

    content { Forgery('lorem_ipsum').words Random() }
  end
end
