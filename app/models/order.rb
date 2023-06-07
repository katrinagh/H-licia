class Order < ApplicationRecord
  belongs_to :user
  has_many :articles

  validates :number, presence: true
  validates :number, uniqueness: true
  validates :delivery_time, presence: true
  validates :confirmed, presence: true
  validates :user_id, uniqueness: true
end
