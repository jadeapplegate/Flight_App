require 'spec_helper'

describe Flight do
       
    describe 'flight_number' do
      it 'should not be empty' do
        user = FactoryGirl.build(:flight, flight_number: nil)
        user.should_not be_valid
      end

      it 'should contain at least 2 characters' do
          user = FactoryGirl.build(:flight, flight_number: "9").should_not be_valid
          user = FactoryGirl.build(:flight, flight_number: "90").should be_valid
        end
    end

    describe 'airline_code' do
      it 'should not be empty' do
        user = FactoryGirl.build(:flight, airline_code: nil)
        user.should_not be_valid
      end

      it 'should contain exactly 2 characters' do
        user = FactoryGirl.build(:flight, airline_code: "SWA").should_not be_valid
        user = FactoryGirl.build(:flight, airline_code: "WN").should be_valid
      end
    end

    describe 'date_month' do
      it 'should not be empty' do
        user = FactoryGirl.build(:flight, date_month: nil)
        user.should_not be_valid
      end

      it 'should contain 1 or 2 characters' do
        user = FactoryGirl.build(:flight, date_month: "6").should be_valid
        user = FactoryGirl.build(:flight, date_month: "06").should be_valid
      end
    end

    describe 'date_day' do
      it 'should not be empty' do
        user = FactoryGirl.build(:flight, date_day: nil)
        user.should_not be_valid
      end

      it 'should contain 1 or 2 characters' do
        user = FactoryGirl.build(:flight, date_day: "1").should be_valid
        user = FactoryGirl.build(:flight, date_day: "12").should be_valid
      end
    end

    describe 'date_year' do
      it 'should not be empty' do
        user = FactoryGirl.build(:flight, date_year: nil)
        user.should_not be_valid
      end

      it 'should contain four characters' do
        user = FactoryGirl.build(:flight, date_year: "2014").should be_valid
      end
    end
    
end
