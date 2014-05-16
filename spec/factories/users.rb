FactoryGirl.define do
  factory :user_1, class: "User" do
    name    "テスト"
    sequence(:mail) { |n| "text#{n}@example.com" }
    tel     "00-000-0000"
  end
end

