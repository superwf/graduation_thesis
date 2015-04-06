class User < ActiveRecord::Base

  belongs_to :role
  has_many :complaints
  has_many :appointments
end
