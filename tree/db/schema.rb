# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_26_030525) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "frammis", primary_key: "part", id: :string, limit: 2, force: :cascade do |t|
    t.integer "qty", null: false
    t.integer "wgt", default: 0, null: false
    t.integer "lft", null: false
    t.integer "rgt", null: false
    t.index ["lft"], name: "frammis_lft_key", unique: true
    t.index ["rgt"], name: "frammis_rgt_key", unique: true
  end

end
