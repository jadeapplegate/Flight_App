class Contact < ActiveRecord::Base
  belongs_to :user

  validates :first_name, presence: true
  validates_length_of :first_name, :minimum => 2
  validates :last_name, presence: true
  validates_length_of :last_name, :minimum => 2
  validates :email, presence: true
  validates_format_of :email, :with => /\A(\S+)@(.+)\.(\S+)\z/
  validates :phone, presence: true
  validates_length_of :phone, :minimum => 10

end
