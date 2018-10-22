# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 4) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expo_settings", force: :cascade do |t|
    t.boolean  "voting_enabled", default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "project_comments", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "project_id", null: false
    t.string   "body",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_comments_on_project_id", using: :btree
    t.index ["user_id"], name: "index_project_comments_on_user_id", using: :btree
  end

  create_table "project_members", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_members_on_project_id", using: :btree
    t.index ["user_id"], name: "index_project_members_on_user_id", using: :btree
  end

  create_table "project_votes", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "project_id", null: false
    t.boolean  "yes",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_votes_on_project_id", using: :btree
    t.index ["user_id"], name: "index_project_votes_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "team",        null: false
    t.string   "description", null: false
    t.string   "client",      null: false
    t.string   "repo_link",   null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "label",       null: false
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "role_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id", using: :btree
    t.index ["user_id"], name: "index_user_roles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                       null: false
    t.string   "last_name",                        null: false
    t.string   "phone_number"
    t.string   "image"
    t.boolean  "enabled",          default: false, null: false
    t.string   "email_address",                    null: false
    t.string   "provider",                         null: false
    t.string   "uid",                              null: false
    t.string   "oauth_token",                      null: false
    t.datetime "oauth_expires_at",                 null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree
  end

  add_foreign_key "project_comments", "projects", name: "fk_project_comment_project"
  add_foreign_key "project_comments", "users", name: "fk_project_comment_user"
  add_foreign_key "project_members", "projects", name: "fk_project_member_project"
  add_foreign_key "project_members", "users", name: "fk_project_member_user"
  add_foreign_key "project_votes", "projects", name: "fk_project_vote_project"
  add_foreign_key "project_votes", "users", name: "fk_project_vote_user"
  add_foreign_key "user_roles", "roles", name: "fk_user_role_role"
  add_foreign_key "user_roles", "users", name: "fk_user_role_user"
end
