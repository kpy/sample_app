FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :appointment do    
  	starttime { 1.hour.ago }
    endtime { Time.now }
  	sequence(:title)  { |n| "Title #{n}" }
  	sequence(:description)  { |n| "Description #{n}" }
  	sequence(:place)  { |n| "Place #{n}" }
    user
  end
end