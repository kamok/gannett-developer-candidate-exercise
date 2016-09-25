require 'open-uri'
require 'json'

class Content
  attr_reader :profile_id, :theme, :articles

  def initialize(profile_id)
    @profile_id = profile_id
  end

  def generate
    content_data = get_content_data

    set_theme(content_data)
    generate_articles(content_data)
    return self
  end

  private

  def get_content_data
    base_url = "https://peaceful-springs-7920.herokuapp.com/content/"
    JSON.parse(open(base_url + "#{@profile_id}/").read)
  end

  def set_theme(content_data)
    @theme = content_data["theme"]
  end

  def generate_articles(content_data)
    @articles = []
    content_data["articles"].each do |article_data|
      @articles << Article.new(article_data)
    end
  end
end