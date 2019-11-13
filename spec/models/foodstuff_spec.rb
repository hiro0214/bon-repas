require 'rails_helper'

describe Foodstuff do
  describe 'foodstuff-test' do

    # 新規インスタンスの作成が出来るか
    it "foodstuff-create" do
      foodstuff = Foodstuff.new(material: "aaa", amount: "bbb")
      expect(foodstuff).to be_valid
    end

    # materialが空でないか
    it "material not null" do
      foodstuff = Foodstuff.new(material: "", amount: "bbb")
      foodstuff.valid?
      expect(foodstuff.errors[:material]).to include("can't be blank")
    end

    # materialの文字数
    it "material length 30" do
      foodstuff = Foodstuff.new(material: "123456789012345678901234567890", amount: "bbb")
      expect(foodstuff).to be_valid
    end

    # amountが空でないか
    it "amount not null" do
      foodstuff = Foodstuff.new(material: "aaa", amount: "")
      foodstuff.valid?
      expect(foodstuff.errors[:amount]).to include("can't be blank")
    end

    # amountの文字数
    it "amount length 20" do
      foodstuff = Foodstuff.new(material: "aaa", amount: "12345678901234567890")
      expect(foodstuff).to be_valid
    end




  end
end