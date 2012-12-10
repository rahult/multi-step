class AdmissionForm < ActiveRecord::Base
  attr_accessible :date_of_admission, :date_of_birth,
                  :email, :first_name, :last_name, :phone,
                  :reason, :step
end
