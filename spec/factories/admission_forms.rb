# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admission_form do
    first_name "John"
    last_name "Doe"
    date_of_birth "2012-12-10"
    email "john@example.com"
    phone "(111) 111111"
    date_of_admission "2012-12-10"
    reason "Reason of admission goes here"
    step nil
  end
end
