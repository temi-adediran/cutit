require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  it "routes to #signup" do
    expect(:get => "/signup").to route_to("users#new")
  end

  it "routes to #login" do
    expect(:get => "/login").to route_to("sessions#new")
  end

  it "routes to #logout" do
    expect(:delete => "/logout").to route_to("sessions#destroy")
  end
end