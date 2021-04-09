require 'rails_helper'

RSpec.describe 'the applications show' do
  before(:each) do
    @application1 = create(:application, status: "Pending")
    @application2 = create(:application, status: "Pending")
    @application3 = create(:application, status: "Pending")

    @pet1 = create(:pet, name: "Thunder")
    @pet2 = create(:pet, name: "Hover")
    @pet2 = create(:pet, name: "Luna")

    PetApplication.create!(application: @application1, pet: @pet1)
    PetApplication.create!(application: @application1, pet: @pet2)
    PetApplication.create!(application: @application2, pet: @pet1)
    PetApplication.create!(application: @application3, pet: @pet2)

    visit "/admin/applications/#{@application1.id}"
  end

  it "shows the application page with pets and approves it" do
    expect(page).to have_button("Approve")
    click_button "Approve"

    expect(current_path).to eq("/admin/applications/#{@application1.id}")
    expect(page).not_to have_button("Approve")
    expect(page).to have_content("Your application has been approved!")
  end

  it "shows the application page with pets and approves it" do
    expect(page).to have_button("Reject")
    click_button "Reject"

    expect(current_path).to eq("/admin/applications/#{@application1.id}")
    expect(page).not_to have_button("Reject")
    expect(page).to have_content("Your application has been rejected, don't come back!")
  end

  it "allows to approve application for one pet when there is already an existing application" do
    expect(page).to have_button("Approve")
    click_button "Approve"

    visit "/admin/applications/#{@application2.id}"

    expect(page).to have_button("Approve")
    expect(page).to have_button("Reject")
  end
end
