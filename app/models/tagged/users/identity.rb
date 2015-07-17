class Tagged::Users::Identity < ActiveRecord::Base
  belongs_to :user,
              class_name: 'Tagged::User',
              foreign_key: 'tagged_user_id' 
end
