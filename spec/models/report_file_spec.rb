# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReportFile, type: :model do
  describe 'factory' do
    let!(:report_file) { FactoryGirl.create :report_file }

    # Factories
    it { expect(report_file).to be_valid }

    it { should belong_to(:report_execution) }
  end
end
