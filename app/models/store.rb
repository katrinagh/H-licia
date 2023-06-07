class Store < ApplicationRecord
    has_many :articles, dependent: :destroy
end
