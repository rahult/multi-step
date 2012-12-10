class AdmissionForm < ActiveRecord::Base

  attr_accessible :date_of_admission, :date_of_birth,
                  :email, :first_name, :last_name, :phone,
                  :reason, :step

  validates :first_name, :last_name, presence: true

  multi_step ["Personal Details", "Contact Details", "Admission Details", "Preview"]

end
