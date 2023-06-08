class Article < ApplicationRecord
  belongs_to :store

  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :price, presence: true
  validates :weight, presence: true
end
