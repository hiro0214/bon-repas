FactoryBot.define do

  factory :food do
    user_id          {"1"}
    food_name        {"カルボナーラ"}
    text             {"testtest"}
    category_id      {"肉"}
    image            {File.open("#{Rails.root}/app/assets/images/ss1.png")}
    servings         {"1人前"}
  end

end