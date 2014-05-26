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

 describe "when email format is invalid" do
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
