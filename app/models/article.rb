class Article
  attr_reader :link, :title, :summary
  def initialize(article_data)
    @link = article_data["href"]
    @title = article_data["title"]
    @summary = article_data["summary"]
  end
end