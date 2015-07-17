class Tagged::User < ActiveRecord::Base

  EMAIL_FORMAT =  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_one :identity,
          class_name: 'Tagged::Users::Identity',
          foreign_key: 'tagged_user_id',
          dependent: :destroy

  validates :email, presence: true
  validates :email, format: { with: EMAIL_FORMAT }

  # Authenticate a user from email / password
  # @param [String] email
  # @param [String] password
  # @return [Tagged::User|nil]
  def self.authenticate(email, password)
    user = self.includes(:identity).find_by(email: email)
    user.try(:identity).try(:authenticate, password) ? user : nil
  end
end
