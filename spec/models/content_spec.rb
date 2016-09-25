require 'rails_helper'

RSpec.describe Content, type: :model do
  describe "#generate" do
    it "returns a new Content instance" do
      profile_id = 1
      content = Content.new(profile_id)

      base_url = "https://peaceful-springs-7920.herokuapp.com/content/"
      content_data = JSON.parse(open(base_url + "#{profile_id}/").read)
      theme = content_data["theme"]
      articles = []
      content_data["articles"].each do |article_data|
        articles << Article.new(article_data)
      end

      expect(content.generate.theme).to eq(theme)
      expect(content.generate.articles.map(&:link)).to eq(articles.map(&:link))
    end 
  end
  
end
