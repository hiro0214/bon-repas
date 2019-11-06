class Recipe < ApplicationRecord

  belongs_to :food

  validates :process ,presence: true

end
