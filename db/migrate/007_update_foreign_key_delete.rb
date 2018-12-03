class UpdateForeignKeyDelete < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key "bookmarks", "projects"
    remove_foreign_key "bookmarks", "users"
    remove_foreign_key "project_comments", "projects"
    remove_foreign_key "project_comments", "users"
    remove_foreign_key "project_members", "projects"
    remove_foreign_key "project_members", "users"
    remove_foreign_key "project_votes", "projects"
    remove_foreign_key "project_votes", "users"
    remove_foreign_key "user_roles", "roles"
    remove_foreign_key "user_roles", "users"


    add_foreign_key "bookmarks", "projects", name: "fk_bookmark_project", on_delete: :cascade
    add_foreign_key "bookmarks", "users", name: "fk_bookmark_user", on_delete: :cascade
    add_foreign_key "project_comments", "projects", name: "fk_project_comment_project", on_delete: :cascade
    add_foreign_key "project_comments", "users", name: "fk_project_comment_user", on_delete: :cascade
    add_foreign_key "project_members", "projects", name: "fk_project_member_project", on_delete: :cascade
    add_foreign_key "project_members", "users", name: "fk_project_member_user", on_delete: :cascade
    add_foreign_key "project_votes", "projects", name: "fk_project_vote_project", on_delete: :cascade
    add_foreign_key "project_votes", "users", name: "fk_project_vote_user", on_delete: :cascade
    add_foreign_key "user_roles", "roles", name: "fk_user_role_role", on_delete: :cascade
    add_foreign_key "user_roles", "users", name: "fk_user_role_user", on_delete: :cascade
  end
end