require 'rails_helper'

describe "the home page", :type => :feature do

  it "says 'My Delicious Articles' " do
    visit '/'

    expect(page).to have_content 'My Delicious Articles'
  end
end