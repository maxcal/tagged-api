# The Identity class stores password for the Doorkeeper password strategy.
class Tagged::Users::Identity < ActiveRecord::Base
  belongs_to :user,
              class_name: 'Tagged::User',
              foreign_key: 'tagged_user_id'
  has_secure_password
end
