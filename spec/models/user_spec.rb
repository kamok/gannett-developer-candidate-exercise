require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:ip_address).on(:create) }

  describe ".fetch_or_create" do
    it "creates user by ip address" do
      ## Local ip address is '0.0.0.0'
      user = User.fetch_or_create("0.0.0.0")
      expect(User.last).to eq(user)
    end

    it "finds existing user by ip address" do
      ## Local ip address is '0.0.0.0'
      User.create(ip_address: "0.0.0.0") 

      user = User.fetch_or_create("0.0.0.0")
      expect(User.last).to eq(user)
    end 
  end
  
end
