class CreateTaggedUsers < ActiveRecord::Migration
  def change
    create_table :tagged_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, index: true
      t.string :username, index: true
      t.timestamps null: false
    end
  end
end
