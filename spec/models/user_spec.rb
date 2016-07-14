require "rails_helper"

RSpec.describe User, type: :model do
  it "is a valid factory" do
    expect(build(:user)).to be_valid
  end

  let(:user) { build(:user) }

  describe "instance methods" do
    context "respond to instance method calls" do
      it { expect(user).to respond_to(:username) }
      it { expect(user).to respond_to(:email) }
      it { expect(user).to respond_to(:password_digest) }
    end
  end

  describe "ActiveModel Validation" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_length_of(:password_digest).is_at_least(6) }
    it { should have_secure_password }
    it { should have_many(:urls) }

    it { should allow_value("Themmy").for(:username) }
    it { should allow_value("temitope.fowotade@andela.com").for(:email) }
    it { should_not allow_value("temitope.fowotade@andela").for(:email) }
    it { should_not allow_value("temitope.fowotade").for(:email) }
    it { should_not allow_value("@.").for(:email) }
  end

  describe ".influential_users" do
    it "order users based on highest number of urls created" do
      User.destroy_all
      themmy = create(:user, urls_count: 20)
      adim = create(:user, urls_count: 10)
      tj = create(:user, urls_count: 15)

      expect(User.influential_users).to eq([themmy, tj, adim])
    end
  end
end
