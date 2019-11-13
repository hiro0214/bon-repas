require 'rails_helper'

describe Food do
  describe 'food-test' do

    # インスタンスの作成が出来るか
    it "food-create" do
      food = build(:food)
      expect(food).to be_valid
    end

    # food_nameが空でないか
    it "food_name not null" do
      food = build(:food, food_name: "")
      food.valid?
      expect(food.errors[:food_name]).to include("can't be blank")
    end

    #  food_nameの文字数
    it "food_name length 40" do
      food = build(:food, food_name:"1234567890123456789012345678901234567890")
      expect(food).to be_valid
    end

    # textが空でないか
    it "text not null" do
      food = build(:food, text: "")
      food.valid?
      expect(food.errors[:text]).to include("can't be blank")
    end

    # textの文字数
    it "text length 80" do
      food = build(:food, text:"12345678901234567890123456789012345678901234567890123456789012345678901234567890")
      expect(food).to be_valid
    end

    # imageが空でないか
    it "image not null" do
      food = build(:food, image: "")
      food.valid?
      expect(food.errors[:image]).to include("can't be blank")
    end

    # category_idが空でないか
    it "category_id not null" do
      food = build(:food, category_id: "")
      food.valid?
      expect(food.errors[:category_id]).to include("can't be blank")
    end

  end
end