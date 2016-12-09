class Slot < ApplicationRecord
	has_many :sessions

	validates :day, :start, { presence: true }

  def self.filter(day)
    Slot.where(day: day)
  end
end
