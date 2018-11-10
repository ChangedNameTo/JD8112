class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false
      t.references :project, null: false

      t.timestamps
    end
    add_foreign_key :bookmarks, :projects, name: 'fk_bookmark_project'
    add_foreign_key :bookmarks, :users, name: 'fk_bookmark_user'

  end
end