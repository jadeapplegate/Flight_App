
FactoryGirl.define do

  sequence :email do |n|
    "mickey#{n}@mouse.com"
  end

  factory :user do
    first_name "Mickey"
    last_name "Mouse"
    email 
    password "password"
    password_confirmation "password"
  end

  factory :flight do
    flight_number "902"
    airline_code "VX"
    date_month "06"
    date_day "03"
    date_year "2014"
  end

  factory :contact do
    first_name "Daffy"
    last_name "Duck"
    email
    phone "5555555555"
  end

end


