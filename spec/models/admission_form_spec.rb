require 'spec_helper'

describe AdmissionForm do
  it "has a valid factory" do
    FactoryGirl.create(:admission_form).should be_valid
  end

  it "is invalid without a first name"
  it "is invalid without a last name"
end
