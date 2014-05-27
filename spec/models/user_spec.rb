require 'spec_helper'

describe User do
  # commenting out these first four tests until we figure out the devise/adding names in profile issue
    # describe 'first_name' do
    #   it 'should not be empty' do
    #     user = FactoryGirl.build(:user, first_name: nil)
    #     user.should_not be_valid
    #   end

    #   it 'should contain at least 2 characters' do
    #     user = FactoryGirl.build(:user, first_name: "A").should_not be_valid
    #     user = FactoryGirl.build(:user, first_name: "Al").should be_valid
    #   end
    # end

    # describe 'last_name' do
    #   it 'should not be empty' do
    #     user = FactoryGirl.build(:user, last_name: nil)
    #     user.should_not be_valid
    #   end

    #   it 'should contain at least 2 characters' do
    #     user = FactoryGirl.build(:user, last_name: "X").should_not be_valid
    #     user = FactoryGirl.build(:user, last_name: "Xi").should be_valid
    #   end
    # end

    describe 'email' do
      it 'should not be empty' do
        user = FactoryGirl.build(:user, email: nil)
        user.should_not be_valid
      end
    end

   describe "email format" do
      it "should be invalid" do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                       foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid_address|
          user = FactoryGirl.build(:user, email: 'daffy.com')
          user.should_not be_valid
        end      
      end
    end
    
end

