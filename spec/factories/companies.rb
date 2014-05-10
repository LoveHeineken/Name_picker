# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company_1, class: "Company" do
    name    "test_1"
    adress  "abcdefghijklmnopqr"
    tel      "000-0000-0000"
    fax      "111-1111-1111"
    url      "http://www.234567890123456789"
  end
end
