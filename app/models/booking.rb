class Booking < ApplicationRecord
  scope :booking_date, -> booking_date {where("booking_date = ?", booking_date)}
  belongs_to :movie
end
