class ArticleOrder < ApplicationRecord
  belongs_to :article
  belongs_to :order
  belongs_to :confirmed_order

  def total_price
    quantity * article.price
  end
end
