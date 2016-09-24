require 'rails_helper'
require 'open-uri'
require 'json'

describe "GET https://peaceful-springs-7920.herokuapp.com/profile/" do
  it "responds with a status code 200" do
    page = open('https://peaceful-springs-7920.herokuapp.com/profile/')
    expect(page.status).to eq(["200", "OK"])
  end

  it 'returns a profileId'do
    page_data = JSON.parse(open('https://peaceful-springs-7920.herokuapp.com/profile/').read)
    expect(page_data).to have_key("profileId")
  end
end
