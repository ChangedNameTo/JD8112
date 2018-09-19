class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false, unique: true
      t.string :description, null: false
      t.string :client, null: false
      t.string :repo_link, null: false

      t.timestamps
    end

    create_table :project_members do |t|
      t.references :user, null: false
      t.references :project, null: false

      t.timestamps
    end

    add_foreign_key :project_members, :projects, name: 'fk_project_member_project'
    add_foreign_key :project_members, :users, name: 'fk_project_member_user'

    create_table :project_comments do |t|
      t.references :user, null: false
      t.references :project, null: false
      t.string :body, null: false

      t.timestamps
    end

    add_foreign_key :project_comments, :projects, name: 'fk_project_comment_project'
    add_foreign_key :project_comments, :users, name: 'fk_project_comment_user'

    create_table :project_votes do |t|
      t.references :user, null: false
      t.references :project, null: false
      t.boolean :yes, null: false

      t.timestamps
    end

    add_foreign_key :project_votes, :projects, name: 'fk_project_vote_project'
    add_foreign_key :project_votes, :users, name: 'fk_project_vote_user'
  end
end