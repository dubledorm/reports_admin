# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReportExecutionDecorator do
  let(:report_execution) { FactoryGirl.build :report_execution, report_status: 1, send_status: -1 }
  let(:report_execution_bad) { FactoryGirl.build :report_execution, report_status: 100, send_status: -100 }

  it { expect(report_execution.decorate.report_status).to eq('Выполняется') }
  it { expect(report_execution.decorate.send_status).to eq('Ошибка') }

  it { expect(report_execution_bad.decorate.report_status).to eq('Неопределён') }
  it { expect(report_execution_bad.decorate.send_status).to eq('Неопределён') }
end
