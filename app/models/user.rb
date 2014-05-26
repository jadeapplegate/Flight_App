class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :flights
  has_many :contacts

  validates :first_name, presence: true
  validates_length_of :first_name, :minimum => 2
  validates :last_name, presence: true
  validates_length_of :last_name, :minimum => 2
  validates :email, presence: true
  validates_format_of :email, :with => /\A(\S+)@(.+)\.(\S+)\z/
  
end
