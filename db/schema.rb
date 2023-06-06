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

ActiveRecord::Schema[7.0].define(version: 2023_06_06_111154) do
  create_table "article_orders", force: :cascade do |t|
    t.integer "quantity"
    t.integer "order_id", null: false
    t.integer "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_orders_on_article_id"
    t.index ["order_id"], name: "index_article_orders_on_order_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "image_url"
    t.string "category"
    t.string "price"
    t.string "weight"
    t.integer "store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_articles_on_store_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "number"
    t.string "delivery_time"
    t.boolean "cart"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "image_url"
    t.integer "rating"
    t.time "estimated_delivery_time"
    t.integer "delivery_fees"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "email"
    t.string "delivery_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "article_orders", "articles"
  add_foreign_key "article_orders", "orders"
  add_foreign_key "articles", "stores"
  add_foreign_key "orders", "users"
end
