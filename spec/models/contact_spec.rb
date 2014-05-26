require 'spec_helper'

  describe Contact do
       
    describe 'first_name' do
      it 'should not be empty' do
        user = FactoryGirl.build(:contact, first_name: nil)
        user.should_not be_valid
      end

      it 'should contain at least 2 characters' do
        user = FactoryGirl.build(:contact, first_name: "E").should_not be_valid
        user = FactoryGirl.build(:contact, first_name: "Ed").should be_valid
      end
    end

    describe 'last_name' do
      it 'should not be empty' do
        user = FactoryGirl.build(:contact, last_name: nil)
        user.should_not be_valid
      end

      it 'should contain at least 2 characters' do
        user = FactoryGirl.build(:contact, last_name: "L").should_not be_valid
        user = FactoryGirl.build(:contact, last_name: "Li").should be_valid
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

      it 'should contain at least 10 characters' do
        user = FactoryGirl.build(:contact, phone: "5555555").should_not be_valid
        user = FactoryGirl.build(:contact, phone: "5555555555").should be_valid
      end


   describe "email format" do
      it "should be invalid" do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                       foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid_address|
          user = FactoryGirl.build(:contact, email: 'daffy.com')
          user.should_not be_valid
        end      
      end
    end



end
