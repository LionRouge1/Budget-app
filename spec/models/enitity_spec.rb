require 'rails_helper'

RSpec.describe Entity, type: :model do
  subject { Entity.new(name: 'Choux', amount: 5) }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end
end