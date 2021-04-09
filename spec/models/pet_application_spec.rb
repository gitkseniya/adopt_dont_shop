# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PetApplication, type: :model do
  describe 'relationships' do
    it { should belong_to :application }
    it { should belong_to :pet }

    it { should validate_numericality_of(:pet_id) }
    it { should validate_numericality_of(:application_id) }
  end
end
