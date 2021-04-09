# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the application update' do
  before(:each) do
    @application1 = create(:application)
    @application2 = create(:application)
    @application3 = create(:application)

    @pet1 = create(:pet, name: 'Thunder')
    @pet2 = create(:pet, name: 'Hover')
    @pet2 = create(:pet, name: 'Luna')

    PetApplication.create!(application: @application1, pet: @pet1)
    PetApplication.create!(application: @application1, pet: @pet2)
    PetApplication.create!(application: @application2, pet: @pet1)
    PetApplication.create!(application: @application3, pet: @pet2)

    visit "/applications/#{@application1.id}"
  end

  it 'shows the application add cover letter form' do
    expect(page).not_to have_content('Anything')

    fill_in :cover_letter, with: 'I will be a wonderful home'
    click_button 'Add/Update CV'
    expect(page).to have_current_path("/applications/#{@application1.id}")
    expect(page).to have_content('I will be a wonderful home')
  end
end
