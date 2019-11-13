class Foodstuff < ApplicationRecord

  belongs_to :food, optional: true

  validates :material ,presence: true, length: {maximum: 30}
  validates :amount ,presence: true, length: {maximum: 20}

end
