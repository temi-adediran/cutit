require 'rails_helper'

RSpec.describe UrlsController, type: :routing do
  it "routes to #homepage" do
    expect(:get => "/").to route_to('urls#homepage')
  end

  it "routes to #edit" do
    expect(:get => "/urls/1/edit").to route_to("urls#edit", :id => "1")
  end
end