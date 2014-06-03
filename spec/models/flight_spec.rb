require 'spec_helper'

describe Flight do
       
    describe 'flight_number' do
      it 'should not be empty' do
        user = FactoryGirl.build(:flight, flight_number: nil)
        user.should_not be_valid
      end
    end

    describe 'airline_code' do
      it 'should not be empty' do
        user = FactoryGirl.build(:flight, airline_code: nil)
        user.should_not be_valid
      end
    end

    describe 'date_month' do
      it 'should not be empty' do
        user = FactoryGirl.build(:flight, date_month: nil)
        user.should_not be_valid
      end
    end

    describe 'date_day' do
      it 'should not be empty' do
        user = FactoryGirl.build(:flight, date_day: nil)
        user.should_not be_valid
      end
    end

    describe 'date_year' do
      it 'should not be empty' do
        user = FactoryGirl.build(:flight, date_year: nil)
        user.should_not be_valid
      end
    end
    
end
