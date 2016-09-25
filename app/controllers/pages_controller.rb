require 'open-uri'
require 'json'

class PagesController < ApplicationController
  def home
    @user = User.fetch_or_create(request.remote_ip)
  end
end
