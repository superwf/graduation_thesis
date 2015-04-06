class Terminal < ActiveRecord::Base
  has_many :terminal_records
  belongs_to :patient
end
