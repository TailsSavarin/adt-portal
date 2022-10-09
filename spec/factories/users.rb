# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    login { Faker::Internet.username }
    password { Faker::Internet.password }
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    middle_name { Faker::Name.middle_name }
    location { Faker::Address.country }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    telegram { Faker::Internet.username }
    position { Faker::Job.title }
    bio { Faker::Quote.matz }
    birthday { Faker::Date.birthday }
  end
end
