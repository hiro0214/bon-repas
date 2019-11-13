require 'rails_helper'

describe Recipe do
  describe "recipe-test" do

    # 新規インスタンスが作成出来るか
    it "recipe-create" do
      recipe = Recipe.new(process: "aaa")
      expect(recipe).to be_valid
    end

    # processが空ないか
    it "process not null" do
      recipe = Recipe.new(process: "")
      recipe.valid?
      expect(recipe.errors[:process]).to include("can't be blank")
    end

    # processの文字数
    it "process length 80" do
      recipe = Recipe.new(process: "12345678901234567890123456789012345678901234567890123456789012345678901234567890")
      expect(recipe).to be_valid
    end

  end
end