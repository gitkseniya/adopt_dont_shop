# frozen_string_literal: true

require 'factory_bot_rails'
require 'faker'

Pet.destroy_all
Application.destroy_all
Shelter.destroy_all

FactoryBot.create(:shelter)

3.times do
  FactoryBot.create(:application)
end

5.times do
  FactoryBot.create(:pet)
end
