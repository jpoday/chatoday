FactoryGirl.define do
  factory :user do
    name "Joe"
  end
  
  factory :room do
    name "NationBuilder Tech Test"
  end
  
  factory :room_user do
    user
    room
  end
  
  factory :comment do
    content "Hey!"
    user
    room
  end
end
    