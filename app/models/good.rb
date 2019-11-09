class Good < ApplicationRecord

  belongs_to :food, counter_cache: :goods_count
  belongs_to :user

end