class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  def self.find_or_create_from_auth_hash(auth_hash)
    user = User.new
    user.provider = auth_hash["provider"]
    user.uid = auth_hash["uid"]
    user.name = auth_hash["info"]["name"]
    user.save
    user
  end
end
