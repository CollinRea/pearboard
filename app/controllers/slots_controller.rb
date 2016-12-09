class SlotsController < ApplicationController

  def index
    @slots_sat = Slot.where(day: "Saturday")
    @slots_sun = Slot.where(day: "Sunday")
    @sat_sessions = User.mentor_slots("Saturday")
    @sun_sessions = User.mentor_slots("Sunday")
    @sat_logged_mentors = @sat_sessions.keys
    @sun_logged_mentors = @sun_sessions.keys
  end

end