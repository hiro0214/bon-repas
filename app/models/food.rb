class Food < ApplicationRecord

  mount_uploader :image, ImageUploader

  validates :food_name ,presence:true
  validates :image ,presence: true
  validates :text ,presence: true
  validates :category_id ,presence: true

end