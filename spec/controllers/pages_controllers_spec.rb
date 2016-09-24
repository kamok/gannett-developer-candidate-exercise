require 'rails_helper'

describe PagesController, :type => :controller do 
  describe "GET home" do
    it "has a 200 status code" do
      get :home
      expect(response.status).to eq(200)
    end
  end

  # describe '#home' do
  #   it "sends a GET request to 'https://peaceful-springs-7920.herokuapp.com/profile/' "do

  #   end
  # end
end


# https://peaceful-springs-7920.herokuapp.com/profile/