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

ActiveRecord::Schema[7.0].define(version: 2023_11_13_131143) do
  create_table "auto_drop_deads", force: :cascade do |t|
    t.integer "sides"
    t.integer "dice_count"
    t.integer "player_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_managers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer "player_id"
    t.boolean "is_dead"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
