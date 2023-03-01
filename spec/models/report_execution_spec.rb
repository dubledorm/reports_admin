# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReportExecution, type: :model do
  describe 'factory' do
    let!(:report_execution) {FactoryGirl.create :report_execution }

    # Factories
    it { expect(report_execution).to be_valid }

    it { should belong_to(:report) }
    it { should have_many(:report_files) }
  end
end
