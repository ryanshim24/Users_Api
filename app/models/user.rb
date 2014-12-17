class User < ActiveRecord::Base
  has_secure_password

  validates :username,
    uniqueness: true,
    presence: true

  def self.authenticate username, password
    User.find_by_username(username).try(:authenticate,password)
  end
end
