class User < ApplicationRecord
	has_many :written_feedback, { foreign_key: :author_id, class_name: "Feedback" }
	has_many :mentor_sessions, { foreign_key: :mentor_id, class_name: "Session" }
	has_many :student_feedback, through: :student_sessions, source: :feedbacks
	has_many :mentor_feedback, through: :mentor_sessions, source: :feedbacks
	has_many :student_sessions, { foreign_key: :student_id, class_name: "Session"}
	has_many :student_slots, through: :student_sessions, source: :slot
	has_many :mentor_slots, through: :mentor_sessions, source: :slot

	validates :full_name, :email, :password_digest, :phone_number, { presence: true }
	validates :email, { uniqueness: true }

	has_secure_password

	has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.mentor_slots(day)
    all_possible_mentors = User.select {|ment| ment.mentor_sessions.length > 0 }
    mentor_session_hash = {}
    days_sessions = Session.slots(day)
    all_possible_mentors.each do |user|
      user_days_sessions = days_sessions.where(mentor_id: user.id)
      if user_days_sessions.length > 0
        mentor_session_hash[user] = user_days_sessions
      end
    end
    mentor_session_hash
  end

end







