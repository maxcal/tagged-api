class CreateTaggedUsersIdentities < ActiveRecord::Migration
  def change
    create_table :tagged_users_identities do |t|
      t.belongs_to :tagged_user, index: true, foreign_key: true
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
