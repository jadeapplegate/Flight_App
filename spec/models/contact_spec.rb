require 'spec_helper'

  describe Contact do
       
    describe 'first_name' do
      it 'should not be empty' do
        user = FactoryGirl.build(:contact, first_name: nil)
        user.should_not be_valid
      end
    end

    describe 'last_name' do
      it 'should not be empty' do
        user = FactoryGirl.build(:contact, last_name: nil)
        user.should_not be_valid
      end
    end

    describe 'email' do
      it 'should not be empty' do
        user = FactoryGirl.build(:contact, email: nil)
        user.should_not be_valid
      end
    end

    describe 'phone' do
      it 'should not be empty' do
        user = FactoryGirl.build(:contact, phone: nil)
        user.should_not be_valid
      end
    end

end
