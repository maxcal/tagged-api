class Tagged::User < ActiveRecord::Base

  EMAIL_FORMAT =  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :email, presence: true
  validates :email, format: { with: EMAIL_FORMAT }
end
