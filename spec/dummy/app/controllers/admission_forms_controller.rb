class AdmissionFormsController < ApplicationController
  # GET /admission_forms
  # GET /admission_forms.json
  def index
    @admission_forms = AdmissionForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admission_forms }
    end
  end

  # GET /admission_forms/1
  # GET /admission_forms/1.json
  def show
    @admission_form = AdmissionForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admission_form }
    end
  end

  # GET /admission_forms/new
  # GET /admission_forms/new.json
  def new
    @admission_form = AdmissionForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admission_form }
    end
  end

  # GET /admission_forms/1/edit
  def edit
    @admission_form = AdmissionForm.find(params[:id])
  end

  # POST /admission_forms
  # POST /admission_forms.json
  def create
    @admission_form = AdmissionForm.new(params[:admission_form])

    respond_to do |format|
      if @admission_form.save
        format.html { redirect_to @admission_form, notice: 'Admission form was successfully created.' }
        format.json { render json: @admission_form, status: :created, location: @admission_form }
      else
        format.html { render action: "new" }
        format.json { render json: @admission_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admission_forms/1
  # PUT /admission_forms/1.json
  def update
    @admission_form = AdmissionForm.find(params[:id])

    respond_to do |format|
      if @admission_form.update_attributes(params[:admission_form])
        format.html { redirect_to @admission_form, notice: 'Admission form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admission_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admission_forms/1
  # DELETE /admission_forms/1.json
  def destroy
    @admission_form = AdmissionForm.find(params[:id])
    @admission_form.destroy

    respond_to do |format|
      format.html { redirect_to admission_forms_url }
      format.json { head :no_content }
    end
  end
end
