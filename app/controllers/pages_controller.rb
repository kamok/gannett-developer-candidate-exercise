require 'open-uri'
require 'json'

class PagesController < ApplicationController
  def home
    @user = User.fetch_or_create(request.remote_ip)
    @content = Content.new(@user.profile_id).generate
  end
end
