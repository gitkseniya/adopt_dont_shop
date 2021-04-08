require 'rails_helper'

RSpec.describe 'application creation' do
  describe 'the application new' do
    it 'can direct user to new application form' do
      visit "/pets"

      expect(page).to have_link('Start an Application')

      click_on 'Start an Application'

      expect(page).to have_current_path('/applications/new')
    end

    it 'can show application form with correct fields' do
      visit '/applications/new'

      expect(find('form')).to have_content('Name')
      expect(find('form')).to have_content('Street address')
      expect(find('form')).to have_content('City')
      expect(find('form')).to have_content('State')
      expect(find('form')).to have_content('Zipcode')
    end

    it 'can take input on fields and create new application' do
      visit '/applications/new'
      fill_in 'Name', with: 'Test Name'
      fill_in 'Street address', with: '123 yellow brick road'
      fill_in 'City', with: 'Neverland'
      fill_in 'state', with: 'ZZ'
      fill_in 'Zipcode', with: 77777

      click_button 'Submit'

      new_application = Application.last

      expect(page).to have_current_path("/applications/#{new_application.id}")

      expect(page).to have_content('Test Name')
      expect(page).to have_content('Add a Pet to this Application')
    end

    it 're-renders the new form with errors shown' do
      visit '/applications/new'

      click_button 'Submit'

      expect(page).to have_current_path('/applications/new')
      expect(page).to have_content("Error: Name can't be blank, Street address can't be blank, City can't be blank, State is the wrong length (should be 2 characters), Zipcode is not a number")
    end
  end
end
