# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admission_form do
    first_name "MyString"
    last_name "MyString"
    date_of_birth "2012-12-10"
    email "MyString"
    phone "MyString"
    date_of_admission "2012-12-10"
    reason "MyText"
    step "MyString"
  end
end
