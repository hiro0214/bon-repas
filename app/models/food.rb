class Food < ApplicationRecord

  has_many :foodstuffs, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :goods, dependent: :destroy

  def good_user(user_id)
    goods.find_by(user_id: user_id)
  end

  accepts_nested_attributes_for :foodstuffs, allow_destroy: true
  accepts_nested_attributes_for :recipes, allow_destroy: true

  mount_uploader :image, ImageUploader

  validates :food_name ,presence:true
  validates :image ,presence: true
  validates :text ,presence: true
  validates :category_id ,presence: true
  validates :servings ,presence: true

end