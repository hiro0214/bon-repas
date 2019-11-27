class Recipe < ApplicationRecord

  belongs_to :food, optional: true

  validates :process ,presence: true, length: {maximum: 80}

end