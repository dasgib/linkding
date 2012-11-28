FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "foobar#{n}" }
    email { "#{username}@example.com" }
    password 'secret'

    after(:create) do |user, proxy|
      user.confirm!
    end
  end
end
