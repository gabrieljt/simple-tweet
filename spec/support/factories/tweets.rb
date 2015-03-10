FactoryGirl.define do
  factory :tweet do
    user

    content { Forgery('lorem_ipsum').words Random.rand 1..20 }
  end

  factory :invalid_tweet, parent: :tweet do
    user nil

    content nil
  end
end
