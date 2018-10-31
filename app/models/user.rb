class User < ApplicationRecord
  include Clearance::User

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :password, presence: {on: create}, length: {minimum: 3}
  has_many :authentications, :dependent => :destroy
  has_many :listings
  has_many :reservations

  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = self.create!(
      name: auth_hash["info"]["name"],
      email: auth_hash["info"]["email"],
      password: SecureRandom.hex(10),
    )
    user.authentications << authentication
    return user
  end

  # grab google to access google for user data
  def google_token
    x = self.authentications.find_by(provider: "google_oauth2")
    return x.token unless x.nil?
  end
end
