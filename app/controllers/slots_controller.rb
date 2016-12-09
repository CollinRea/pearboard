class SlotsController < ApplicationController

  def index
    @slots_sat = Slot.filter("Saturday")
    @slots_sun = Slot.filter("Sunday")
    @sat_sessions = User.mentor_slots("Saturday")
    p @sat_sessions
    @sun_sessions = User.mentor_slots("Sunday")
    @sat_logged_mentors = @sat_sessions.keys
    @sun_logged_mentors = @sun_sessions.keys


  end

end