require 'rails_helper'

describe "the home page", :type => :feature do

  it "says 'My Delicious Articles' " do
    visit '/'

    expect(page).to have_content 'My Delicious Articles'
  end

  it "says the articles in the order they are returned from the endpoint" do
    visit '/'

    profile_id = User.last.profile_id
    title = Content.new(profile_id).generate.articles.map(&:title)

    expect(page.all(:css, 'h4').map(&:text)).to eq(title)
  end
end