require 'open-uri'
require 'json'

class PagesController < ApplicationController
  def home
    @user = User.fetch_or_create(request.remote_ip)
    @articles = Content.new(@user.profile_id).generate.articles
    #Remember that content has articles, profile_id, and theme
  end
end
