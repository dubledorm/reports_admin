# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Report, type: :model do
  describe 'factory' do
    let!(:report) {FactoryGirl.create :report}

    # Factories
    it { expect(report).to be_valid }

    it { should have_many(:report_executions) }
  end
end
