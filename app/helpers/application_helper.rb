module ApplicationHelper

  def logged_in?
  	return true if session[:user_id]
  end

  def current_user
    User.find(session[:user_id]) if logged_in?
  end

  def slot_checker(sessions, user, slot)
    if user.mentor_sessions.any? 
      if sessions[user].any? { |session| session.slot_id == slot.id }
        booked_session = sessions[user].find { |session| session.slot_id == slot.id }
        if booked_session.student 
          booked_session.student
        else
          Session.find_by(mentor_id: user.id, slot_id: slot.id)
        end
      else
        "x"
      end
    else
      "enable"
    end
  end

end
