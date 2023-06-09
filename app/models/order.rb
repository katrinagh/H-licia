class Order < ApplicationRecord
  belongs_to :user
  has_many :article_orders

  validates :number, presence: true
  validates :number, uniqueness: true
  validates :delivery_time, presence: true
  validate :unique_for_user

  private

  def unique_for_user
    errors.add(:user_id, 'There is already a cart for this user') if user.orders.where(confirmed: false).count > 0
  end
end
