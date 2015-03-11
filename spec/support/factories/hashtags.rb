FactoryGirl.define do
  factory :hashtag do
    keyword { '#' + Forgery(:name).job_title.delete(' ') }
  end

  factory :invalid_hashtag, parent: :hashtag do
    keyword nil
  end
end
