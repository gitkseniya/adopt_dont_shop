# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the applications index' do
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

    visit '/applications'
  end

  it 'shows the list of all applications' do
    expect(page).to have_content(@application1.name)
    expect(page).to have_content(@application2.city)
    expect(page).to have_content(@pet1.name)
  end
end
