FactoryGirl.define do
  factory :user do
    email "brittamuster@example.de"
    password "Password"
    first_name "Britta"
    last_name "Muster"
    admin false
  end
end