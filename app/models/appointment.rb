class Appointment < ActiveRecord::Base
  attr_accessible :description, :endtime, :place, :starttime, :title, :ispublic
  belongs_to :user
  validates :owner_id, presence: true
  validates :starttime, presence: true
  validates :endtime, presence: true
  validates :title, presence: true, length: { maximum: 140 }
  validates :description, length: { maximum: 500 }
  validates :place, length: { maximum: 250 }

  default_scope order: 'appointments.starttime DESC'

  def check_start_and_end
    if self.endtime.present?
      errors.add(:endtime, 'must come after the start time') if self.endtime.present? && self.endtime < self.starttime
    end
  end
end
