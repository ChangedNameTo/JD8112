class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :label, null: false, unique: true
      t.string :description, null: false

      t.timestamps
    end

    create_table :user_roles do |t|
      t.references :user, null: false
      t.references :role, null: false

      t.timestamps
    end

    add_foreign_key :user_roles, :roles, name: 'fk_user_role_role'
    add_foreign_key :user_roles, :users, name: 'fk_user_role_user'
  end
end
