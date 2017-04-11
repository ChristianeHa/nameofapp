FactoryGirl.define do

  factory :product do
    name "Super bike"
    description "perfect bike to cycle"
    image_url "bike1.jpg"
    colour "red"
    price "30"
  end


  factory :producttwo do
    name "Red bike"
    description "perfect bike"
    image_url "bike2.jpg"
    colour "red"
    price "40"
  end

  factory :productthree do
    name "Blue bike"
    description "Blue bike"
    image_url "bike3.jpg"
    colour "blue"
    price "60"
  end

end