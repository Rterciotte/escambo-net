class Chat < ApplicationRecord
  belongs_to :ad
  has_one :user
end
