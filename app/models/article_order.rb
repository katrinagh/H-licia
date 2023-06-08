class ArticleOrder < ApplicationRecord
  belongs_to :order
  belongs_to :article

  validates :quantity, presence: true
end
