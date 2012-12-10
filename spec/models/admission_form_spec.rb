require 'spec_helper'

describe AdmissionForm do

  it "has a valid factory" do
    create(:admission_form).should be_valid
  end

  it "is invalid without a first name" do
    build(:admission_form, first_name: nil).should_not be_valid
  end

  it "is invalid without a last name" do
    build(:admission_form, last_name: nil).should_not be_valid
  end

end
