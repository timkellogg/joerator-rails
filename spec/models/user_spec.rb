require 'rails_helper'

describe User do 
  before do
  	@user = User.create(name: "First", email: "user@example.com",
  		                  password: "password", password_confirmation: "password")
  end

  it { should validate_presence_of   :name           }
  it { should validate_presence_of   :email          }

  it { should validate_uniqueness_of :email          }
  
  it { should validate_length_of     :bio            }
  it { should validate_length_of     :location       }
  it { should validate_length_of     :facebook_link  }
  it { should validate_length_of     :twitter_link   }
  it { should validate_length_of     :google_link    }
  it { should validate_length_of     :instagram_link }
  it { should validate_length_of     :password       }
  it { should validate_length_of     :email          }
  it { should validate_length_of     :name           }
  it { should validate_length_of     :password       }

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

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
end
