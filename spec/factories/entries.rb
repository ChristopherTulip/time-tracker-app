# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    started_at  (Time.now - 1.hour)
    ended_at    Time.now
    user
  end
end
