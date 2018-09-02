class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone_number
      t.string :image
      t.boolean :enabled, null: false, default: false
      t.string :email_address, null: false, unique: true
      t.string :provider, null: false
      t.string :uid, null: false, unique:true
      t.string :oauth_token, null: false
      t.datetime :oauth_expires_at, null: false

      t.timestamps
    end

    add_index :users, [:provider, :uid], unique: true
  end
end
