class Event < ActiveRecord::Base

#Prevent Events from being saved when:
#a. The events date is empty, in the past, or is not valid.
#b. The events title is already taken or empty.
#c. The event organizers name is empty.
#d. The event organizers email address is invalid.

  attr_accessor :month, :day, :year

  validates :organizer_name, presence: true
  validates :title, presence: true, uniqueness: true
  validates :date, presence: true
  validate :cannot_be_in_the_past
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :organizer_email, :format => { :with => VALID_EMAIL_REGEX }

  before_validation :get_date

  def cannot_be_in_the_past
    if date && date < Date.today
      errors.add(:date, "can't be in the past.")
    end
  end

  def get_date
    begin
      self.date = Date.new(@year.to_i, @month.to_i, @day.to_i)
    rescue
      errors.add(:date, "must be a valid date.")
      self.date = nil
    end
  end
end
