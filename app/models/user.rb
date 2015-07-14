class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  def self.create_with_omniauth(auth_hash)
    user = User.new
    user.provider = auth_hash["provider"]
    user.uid = auth_hash["uid"]
    user.name = auth_hash["info"]["name"]
    user.save
    user    
  end
end
