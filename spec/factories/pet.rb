# frozen_string_literal: true

FactoryBot.define do
  factory :pet, class: Pet do
    adoptable { Faker::Boolean.boolean }
    age { Faker::Number.between(from: 1, to: 20) }
    breed { Faker::Creature::Cat.breed }
    name { Faker::Creature::Animal.unique.name }

    association :shelter, factory: :shelter
  end
end
