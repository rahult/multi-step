require 'spec_helper'

describe AdmissionFormsController do

  # This should return the minimal set of attributes required to create a valid
  # AdmissionForm. As you add validations to AdmissionForm, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    attributes_for(:admission_form)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AdmissionFormsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all admission_forms as @admission_forms" do
      admission_form = AdmissionForm.create! valid_attributes
      get :index, {}, valid_session
      assigns(:admission_forms).should eq([admission_form])
    end
  end

  describe "GET show" do
    it "assigns the requested admission_form as @admission_form" do
      admission_form = AdmissionForm.create! valid_attributes
      get :show, {:id => admission_form.to_param}, valid_session
      assigns(:admission_form).should eq(admission_form)
    end
  end

  describe "GET new" do
    it "assigns a new admission_form as @admission_form" do
      get :new, {}, valid_session
      assigns(:admission_form).should be_a_new(AdmissionForm)
    end
  end

  describe "GET edit" do
    it "assigns the requested admission_form as @admission_form" do
      admission_form = AdmissionForm.create! valid_attributes
      get :edit, {:id => admission_form.to_param}, valid_session
      assigns(:admission_form).should eq(admission_form)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new AdmissionForm" do
        expect {
          post :create, {:admission_form => valid_attributes}, valid_session
        }.to change(AdmissionForm, :count).by(1)
      end

      it "assigns a newly created admission_form as @admission_form" do
        post :create, {:admission_form => valid_attributes}, valid_session
        assigns(:admission_form).should be_a(AdmissionForm)
        assigns(:admission_form).should be_persisted
      end

      it "redirects to the created admission_form" do
        post :create, {:admission_form => valid_attributes}, valid_session
        response.should redirect_to(AdmissionForm.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved admission_form as @admission_form" do
        # Trigger the behavior that occurs when invalid params are submitted
        AdmissionForm.any_instance.stub(:save).and_return(false)
        post :create, {:admission_form => { "first_name" => "invalid value" }}, valid_session
        assigns(:admission_form).should be_a_new(AdmissionForm)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        AdmissionForm.any_instance.stub(:save).and_return(false)
        post :create, {:admission_form => { "first_name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested admission_form" do
        admission_form = AdmissionForm.create! valid_attributes
        # Assuming there are no other admission_forms in the database, this
        # specifies that the AdmissionForm created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        AdmissionForm.any_instance.should_receive(:update_attributes).with({ "first_name" => "MyString" })
        put :update, {:id => admission_form.to_param, :admission_form => { "first_name" => "MyString" }}, valid_session
      end

      it "assigns the requested admission_form as @admission_form" do
        admission_form = AdmissionForm.create! valid_attributes
        put :update, {:id => admission_form.to_param, :admission_form => valid_attributes}, valid_session
        assigns(:admission_form).should eq(admission_form)
      end

      it "redirects to the admission_form" do
        admission_form = AdmissionForm.create! valid_attributes
        put :update, {:id => admission_form.to_param, :admission_form => valid_attributes}, valid_session
        response.should redirect_to(admission_form)
      end
    end

    describe "with invalid params" do
      it "assigns the admission_form as @admission_form" do
        admission_form = AdmissionForm.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AdmissionForm.any_instance.stub(:save).and_return(false)
        put :update, {:id => admission_form.to_param, :admission_form => { "first_name" => "invalid value" }}, valid_session
        assigns(:admission_form).should eq(admission_form)
      end

      it "re-renders the 'edit' template" do
        admission_form = AdmissionForm.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AdmissionForm.any_instance.stub(:save).and_return(false)
        put :update, {:id => admission_form.to_param, :admission_form => { "first_name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested admission_form" do
      admission_form = AdmissionForm.create! valid_attributes
      expect {
        delete :destroy, {:id => admission_form.to_param}, valid_session
      }.to change(AdmissionForm, :count).by(-1)
    end

    it "redirects to the admission_forms list" do
      admission_form = AdmissionForm.create! valid_attributes
      delete :destroy, {:id => admission_form.to_param}, valid_session
      response.should redirect_to(admission_forms_url)
    end
  end

end
