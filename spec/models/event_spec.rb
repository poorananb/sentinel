require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { create(:event) }

  it 'is valid' do
    expect(subject).to be_valid
  end

  describe '#praxis_code' do
    it 'is required' do
      subject.praxis_code = nil
      expect(subject).to be_invalid
    end
  end

  describe '#event_id' do
    it 'is required' do
      subject.event_id = nil
      expect(subject).to be_invalid
    end
  end

  describe '#occurred_at' do
    it 'is required' do
      subject.occurred_at = nil
      expect(subject).to be_invalid
    end
  end
end
