# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contacts_flight, :class => 'ContactsFlights' do
    contact_id 1
    flight_id 1
  end
end
