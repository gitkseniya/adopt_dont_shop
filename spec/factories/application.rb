FactoryBot.define do
  factory :applicant, class: Application do
    name { Faker::TvShows::Friends.unique.character  }
    street_address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zipcode { Faker::Address.zip }
    status { ["In Progress", "Pending", "Accepted", "Rejected"].sample }
    cover_letter { Faker::TvShows::Simpsons.quote }
  end
end
