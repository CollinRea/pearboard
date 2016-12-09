class SlotsController < ApplicationController

  def index
    @slots_sat = Slot.where(day: "Saturday")
    @slots_sun = Slot.where(day: "Sunday")
    @sessions = User.user_mentor_slots
    @logged_mentors = @sessions.keys
  end

end