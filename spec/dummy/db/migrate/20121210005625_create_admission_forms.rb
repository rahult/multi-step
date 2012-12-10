class CreateAdmissionForms < ActiveRecord::Migration
  def change
    create_table :admission_forms do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :email
      t.string :phone
      t.date :date_of_admission
      t.text :reason
      t.string :step

      t.timestamps
    end
  end
end
