class Ad < ApplicationRecord
  validates :name, :category, :description, :price, :photo, :quantity, presence: true
end
