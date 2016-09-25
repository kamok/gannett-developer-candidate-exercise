require 'open-uri'
require 'json'

class User < ApplicationRecord
  validates :ip_address, presence: true

  def self.fetch_or_create(ip_address)
    if user = User.find_by(ip_address: ip_address)
      return user
    else
      user = User.create(ip_address: ip_address, profile_id: get_profile_id)
      user
    end
  end

  private 

  def self.get_profile_id
    JSON.parse(open('https://peaceful-springs-7920.herokuapp.com/profile/').read)["profileId"]
  end

end
