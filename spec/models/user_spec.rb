require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
  	@user = User.create(name: "First", email: "user@example.com",
  		                  password: "password", password_confirmation: "password")
  end

  subject { @user }

  it { should be_valid }

  describe "when name not present" do 
  	before { @user.name = " "}
  	it { should_not be_valid }
  end

  describe "when email is not present" do  
  	before { @user.email = " "}
  	it { should_not be_valid }
  end

  describe "name should not be too long" do  
  	before { @user.name = "a" * 51 }
  	it { should_not be_valid }
  end

  describe "email should not be too long" do  
  	before { @user.email = "a" * 256 }
  	it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  # describe "when email address is already taken" do
  #   before do
  #     user_with_same_email = @user.dup
  #     user_with_same_email.email = @user.email.upcase
  #     user_with_same_email.save
  #   end

  #   it { should_not be_valid }
  # end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password is too short" do  
  	before do 
  		@user.password = "passwor"
  		@user.password_confirmation = "passwor"
  	end

  	it { should_not be_valid }
  end

  describe "when password is blank" do 
  	before do 
  		@user.password = " " * 8
  		@user.password_confirmation = " " * 8
  	end

  	it { should_not be_valid }
  end


end



















#