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

  describe "acts as a multi form model" do

    context "setting up multi form" do

      it "should respond to the multi_step method" do
        AdmissionForm.should respond_to :multi_step
      end

      it "should return an array of all form steps" do
        AdmissionForm.form_steps.should eql(
          ["Personal Details", "Contact Details", "Admission Details", "Preview"]
        )
      end

      it "should return an array of sanitized multi form steps" do
        AdmissionForm.form_steps_sanitized.should eql(
          ["personal-details", "contact-details", "admission-details", "preview"]
        )
      end

    end

    context "set default value" do

      it "should return the first value of the multiple steps when creating a new admission record" do
        admission_form = create(:admission_form)
        admission_form.current_step.should eql AdmissionForm.form_steps_sanitized.first
      end

    end

    context "basic state methods" do

      it "should respond with true if the current step is the first step" do
        admission_form = create(:admission_form)
        admission_form.first_step?.should be_true
      end

      it "should respond with true if the current step is the last step" do
        admission_form = create(:admission_form, step: AdmissionForm.form_steps_sanitized.last)
        admission_form.last_step?.should be_true
      end

      it "should be able to mark the form as complete" do
        admission_form = create(:admission_form, step: AdmissionForm.form_steps_sanitized.first)
        admission_form.complete!
        admission_form.complete?.should be_true
      end

      context "switching to next step" do

        it "should switch to next if not completed" do
          starting_step = AdmissionForm.form_steps_sanitized[0]
          next_step = AdmissionForm.form_steps_sanitized[1]
          admission_form = create(:admission_form, step: starting_step)
          admission_form.next_step!
          admission_form.current_step.should eql next_step
        end

        it "should not change state if completed" do
          admission_form = create(:admission_form)
          admission_form.complete!
          admission_form.next_step!
          admission_form.current_step.complete?.should be_true
        end

      end

    end

  end

end
