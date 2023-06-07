class Article < ApplicationRecord
  belongs_to :store
  has_one_attached :photo
end
