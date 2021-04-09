class Admin::SheltersController < ApplicationController
  def index
    @shelters = Shelter.pending_applications
  end
end
