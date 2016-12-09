class SlotsController < ApplicationController

  def index
    @session = Session.new
    @slots_sat = Slot.filter("Saturday")
    @slots_sun = Slot.filter("Sunday")
    @sat_sessions = User.mentor_slots("Saturday")
    @sun_sessions = User.mentor_slots("Sunday")
    @sat_logged_mentors = @sat_sessions.keys
    @sun_logged_mentors = @sun_sessions.keys
  end

  def create
    slot = Slot.find(params[:slot_id])
    time = slot.start.split(":")
    if slot.day == "Saturday"
      day = DateTime.now.sunday.prev_day
    else
      day = DateTime.now.sunday
    end
    accurate_day_time = day.change({hour: time.first.to_i, min: time.last.to_i })
    session = Session.new(mentor_id: current_user.id, slot_id: slot.id, session_datetime: accurate_day_time)
    session.save
    p session.errors
    redirect_to '/slots'
  end

end