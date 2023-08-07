# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    email { 'test@dummymail.com' }
    password { 'password' }
  end
end
