FactoryGirl.define do
  factory :bookmark do
    title 'Foobar'
    sequence(:url) { |n| "http://example.com/#{n}" }
    user
  end
end