class Flight < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact

  validates :flight_number, presence: true
  validates_length_of :flight_number, :minimum => 2
  validates :airline_code, presence: true
  validates_length_of :airline_code, :is => 2
  validates :date_month, presence: true
  validates_length_of :date_month, :minimum => 1, :maximum => 2
  validates :date_day, presence: true
  validates_length_of :date_day, :minimum => 1, :maximum => 2
  validates :date_year, presence: true
  validates_length_of :date_year, :is => 4

end
