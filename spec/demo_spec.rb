# frozen_string_literal: true
#
require './demo'
require 'spec_helper'

RSpec.describe 'something' do
  let(:po) { FactoryBot.create :post }
  let(:poa) { FactoryBot.create :post, :approved }

  it do
    expect(po.ref).to be_present
    expect(poa.ref).to be_present
  end
end
