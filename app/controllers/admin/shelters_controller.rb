# frozen_string_literal: true

module Admin
  class SheltersController < ApplicationController
    def index
      @shelters = Shelter.pending_applications
    end
  end
end
