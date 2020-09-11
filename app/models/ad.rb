class Ad < ApplicationRecord
  belongs_to :user
  validates :name, :category, :description, :price, :photo, :quantity, presence: true
  enum status: {
    active: 0,
    on_hold: 1,
    finished: 2
  }
end
