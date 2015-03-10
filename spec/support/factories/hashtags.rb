FactoryGirl.define do
  factory :hashtag do
    keyword { '#' + Forgery('name').job_title.delete(' ') }
  end
end
