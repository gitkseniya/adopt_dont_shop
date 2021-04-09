# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the applications show' do
  it "shows the application and all it's attributes" do
    shelter = create(:shelter, id: 9999)
    pet = Pet.create!(adoptable: true, age: 1, breed: 'lalalalla', name: 'Luna', shelter_id: 9999)
    application = create(:application)

    visit "/applications/#{application.id}"

    expect(page).to have_content(application.name)
    expect(page).to have_content(application.street_address)
    expect(page).to have_content(application.city)
    expect(page).to have_content(application.state)
    expect(page).to have_content(application.zipcode)
    expect(page).to have_content(application.status)

    expect(page).not_to have_content(pet.name)

    fill_in 'Search', with: 'Lu'
    click_button 'Search'
    expect(page).to have_content(pet.name)
  end
end
