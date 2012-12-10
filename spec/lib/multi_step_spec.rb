require 'spec_helper'

describe MultiStep do

  it { AdmissionForm.should respond_to :multi_step }

  it "should return an array of multi form steps" do
    AdmissionForm.form_steps.should eql(
      ["Personal Details", "Contact Details", "Admission Details", "Preview"]
    )
  end

end
