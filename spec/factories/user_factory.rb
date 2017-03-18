FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@email.com" }
  factory :user do
    email
    password "Password"
    first_name "Britta"
    last_name "Muster"
    admin false
  end

  factory :usertwo do
    email
    password "Password"
    first_name "Tina"
    last_name "Mustermann"
    admin false
  end

  factory :admin, class: User do
    email
    password "Password"
    first_name "Admin"
    last_name "User"
    admin true
  end



end