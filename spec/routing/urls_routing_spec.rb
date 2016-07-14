require "rails_helper"

RSpec.describe UrlsController, type: :routing do
  it "routes to #homepage" do
    expect(get: "/").to route_to("urls#homepage")
  end

  it "routes to #details" do
    expect(get: "/details/1").to route_to("urls#details", id: "1")
  end

  it "routes to #dashboard" do
    expect(get: "/dashboard").to route_to("urls#dashboard")
  end

  it "routes to #edit" do
    expect(get: "/edit/1").to route_to("urls#edit", id: "1")
  end

  it "routes to #inactive" do
    expect(get: "/inactive").to route_to("urls#inactive")
  end

  it "routes to #deleted" do
    expect(get: "/deleted").to route_to("urls#deleted")
  end

  it "routes to #update" do
    expect(patch: "/urls/1").to route_to("urls#update", id: "1")
  end

  it "routes to #create" do
    expect(post: "/urls").to route_to("urls#create")
  end
end
