class PagesController < ApplicationController
  def home
    @user = User.fetch_or_create(request.remote_ip)
    
    content = Content.new(@user.profile_id).generate
    @articles = content.articles
    @theme = content.theme
    #content has articles, profile_id, and theme
  end
end
