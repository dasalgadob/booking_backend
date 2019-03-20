class Movie < ApplicationRecord
  scope :by_date, -> selected_date {where("start_date <= ? and end_date >= ?", selected_date, selected_date)}
  has_many :bookings

end
