class Foodstuff < ApplicationRecord

  belongs_to :food

  validates :material ,presence: true
  validates :amount ,presence: true

end
