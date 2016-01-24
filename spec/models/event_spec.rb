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

  # denormalized fields

  describe '#client_code' do
    it 'is required' do
      subject.client_code = nil
      expect(subject).to be_invalid
    end
  end

  describe '#milestone_key' do
    it 'is required' do
      subject.milestone_key = nil
      expect(subject).to be_invalid
    end
  end

  describe '#realm_code' do
    it 'is required' do
      subject.realm_code = nil
      expect(subject).to be_invalid
    end
  end

  describe '#prosess_code' do
    it 'is required' do
      subject.prosess_code = nil
      expect(subject).to be_invalid
    end
  end

  describe '#stage_code' do
    it 'is required' do
      subject.stage_code = nil
      expect(subject).to be_invalid
    end
  end

  describe '#sequence' do
    it 'is required' do
      subject.sequence = nil
      expect(subject).to be_invalid
    end
  end
end
