# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email                 "me@stuff.com"
    password              "myPassword"
    password_confirmation "myPassword"
    access_token          "myToken"
  end
end
