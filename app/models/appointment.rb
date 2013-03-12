class Appointment < ActiveRecord::Base
  attr_accessible :description, :endtime, :place, :starttime, :title, :ispublic
  belongs_to :user
  validates :owner_id, presence: true

  #default_scope order: 'appointments.starttime ASC'
end
