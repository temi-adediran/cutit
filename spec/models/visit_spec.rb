require 'rails_helper'

RSpec.describe Visit, type: :model do
  it 'is a valid factory' do
    expect(build(:visit)).to be_valid
  end

  let(:visit) { build(:visit) }

  describe 'instance methods' do
    context 'respond to instance method calls' do
      it { expect(visit).to respond_to(:browser) }
      it { expect(visit).to respond_to(:version) }
      it { expect(visit).to respond_to(:os) }
      it { expect(visit).to respond_to(:platform) }
    end
  end

  describe 'ActiveModel Validation' do
    it { should belong_to(:url) }
  end
end
