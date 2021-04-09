# frozen_string_literal: true

FactoryBot.define do
  factory :application, class: Application do
    name { Faker::TvShows::Friends.unique.character }
    street_address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zipcode { 123_456 }
    status { ['In Progress', 'Pending', 'Accepted', 'Rejected'].sample }
  end
end
