class Article < ApplicationRecord
  belongs_to :store

  validates :title, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
  validates :category, presence: true
  validates :price, presence: true
  validates :weight, presence: true
  validates :store_id, uniqueness: true
end
