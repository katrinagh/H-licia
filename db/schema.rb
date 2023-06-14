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

ActiveRecord::Schema[7.0].define(version: 20_230_613_083_125) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'article_orders', force: :cascade do |t|
    t.integer 'quantity'
    t.bigint 'order_id', null: false
    t.bigint 'article_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['article_id'], name: 'index_article_orders_on_article_id'
    t.index ['order_id'], name: 'index_article_orders_on_order_id'
  end

  create_table 'articles', force: :cascade do |t|
    t.string 'title'
    t.string 'description'
    t.string 'image_url'
    t.string 'category'
    t.float 'price'
    t.integer 'weight'
    t.bigint 'store_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['store_id'], name: 'index_articles_on_store_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.string 'number'
    t.string 'delivery_time'
    t.boolean 'confirmed', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.float 'latitude', default: 46.517983
    t.float 'longitude', default: 6.632351
    t.index ['user_id'], name: 'index_orders_on_user_id'
  end

  create_table 'stores', force: :cascade do |t|
    t.string 'title'
    t.string 'description'
    t.string 'image_url'
    t.integer 'rating'
    t.string 'estimated_delivery_time'
    t.integer 'delivery_fees'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'first_name'
    t.string 'last_name'
    t.string 'phone_number'
    t.string 'delivery_address', default: 'rue de Lausanne 64, Renens', null: false
    t.float 'latitude', default: 46.525021
    t.float 'longitude', default: 6.57538
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'article_orders', 'articles'
  add_foreign_key 'article_orders', 'orders'
  add_foreign_key 'articles', 'stores'
  add_foreign_key 'orders', 'users'
end
