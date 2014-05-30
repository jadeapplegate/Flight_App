class Flight < ActiveRecord::Base
  belongs_to :user
  has_many :contacts_flights
  has_many :contacts, through: :contacts_flights

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
  validates :arrival_airport, presence: true
  validates :arrival_time, presence: true
  validates :departure_time, presence: true
  validates :departure_airport, presence: true
  validates :departure_city, presence: true
  validates :arrival_city, presence: true
  validates :airline_name, presence: true

  def flights_today
    where("departure_time BETWEEN ? AND ?", DateTime.current.beginning_of_day, DateTime.tomorrow.beginning_of_day)
  end
end
