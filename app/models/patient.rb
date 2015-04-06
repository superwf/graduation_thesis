class Patient < ActiveRecord::Base
  has_and_belongs_to_many :guardians
  has_many :patient_records
  has_many :patient_services
end
