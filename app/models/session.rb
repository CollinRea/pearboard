class Session < ApplicationRecord
	belongs_to :slot
	belongs_to :student, { class_name: "User", optional: true }
	belongs_to :mentor, { class_name: "User" }
	has_many :feedbacks

	validates :mentor_id, :slot_id, :session_datetime, { presence: true }

  def self.slots(day)
    joins(:slot).merge(Slot.filter(day))
  end
end
