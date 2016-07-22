require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#friendly_date" do
    it "customizes the date format" do
      date = "22/07/2016"
      date_time = DateTime.parse(date)
      expect(friendly_date(date_time )).to eq("July 22, 2016")
    end
  end
end
