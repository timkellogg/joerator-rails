require 'rails_helper'

describe User do
  it { should validate_presence_of   :name           }
  it { should validate_presence_of   :email          }
  it { should have_many :assessments                 }

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

  it { should_not allow_value("user@foo,com").for(:email)}
  it { should allow_value("user@foo.COM").for(:email)}
end
