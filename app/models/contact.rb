class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :contacts_flights
  has_many :flights, through: :contacts_flights


  validates :first_name, presence: true
  validates_length_of :first_name, :minimum => 2
  validates :last_name, presence: true
  validates_length_of :last_name, :minimum => 2
  validates :email, presence: true
  validates_format_of :email, :with => /\A(\S+)@(.+)\.(\S+)\z/
  validates :phone, presence: true
  validates_length_of :phone, :is => 10
  validates :phone, format: { with: /\d{3}\d{3}\d{4}/, message: "bad format" }

  def full_name
    "#{first_name} #{last_name}"
  end

end