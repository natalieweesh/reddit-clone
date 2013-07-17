class User < ActiveRecord::Base
  attr_accessible :username, :password_digest, :session_token, :password

  has_secure_password

  has_many :subs
  has_many :links

end