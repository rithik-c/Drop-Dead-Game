# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2025_02_19_053442) do
  create_table "auto_drop_deads", force: :cascade do |t|
    t.integer "sides"
    t.integer "dice_count"
    t.integer "player_count"
    t.integer "game_history_id", null: false
    t.datetime "datetime"
    t.text "game_output"
    t.index ["game_history_id"], name: "index_auto_drop_deads_on_game_history_id"
  end

  create_table "game_histories", force: :cascade do |t|
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_game_histories_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "username"
  end

  add_foreign_key "auto_drop_deads", "game_histories"
  add_foreign_key "game_histories", "users"
end
