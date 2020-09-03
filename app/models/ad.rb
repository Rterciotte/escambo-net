class Ad < ApplicationRecord
    validates :name, :category, :description, 
              :photo, :price, :quantity, presence: true

    enum status: { on_sale: 0, on_hold: 1, sold: 2 }              
end
