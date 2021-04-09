# frozen_string_literal: true

require 'factory_bot_rails'

PetApplication.destroy_all
Pet.destroy_all
Application.destroy_all
Shelter.destroy_all

FactoryBot.create(:shelter)

3.times do
  FactoryBot.create(:application)
end

30.times do
  FactoryBot.create(:pet)
end
