require 'rails_helper'

RSpec.describe Url, type: :model do
  it 'is a valid factory' do
    expect(build(:url)).to be_valid
  end

  let(:url) { build(:url) }

  describe 'instance methods' do
    context 'respond to instance method calls' do
      it { expect(url).to respond_to(:long_url) }
      it { expect(url).to respond_to(:short_url) }
    end
  end

  describe 'ActiveModel Validation' do
    it { should belong_to(:user) }
    it { should have_many(:visits) }
    it { should validate_presence_of(:long_url) }
    it { should validate_uniqueness_of(:short_url) }

    it { should allow_value('https://andela.com').for(:long_url) }
    it { should allow_value('www.andela.com').for(:long_url) }
    it { should allow_value('andela.com').for(:long_url) }
  end

  describe '.popular_links' do
    it 'order urls based on highest number of visits' do
      Url.destroy_all
      themmy = create(:url, click_count: 1)
      adim = create(:url, click_count: 2)
      tj = create(:url, click_count: 3)

      expect(Url.popular_links).to eq([tj, adim, themmy])
    end
  end
end
