require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Password Validation" do
    user = User.create(email: "test@dummymail.com", password: "password")

    it "should validate the password for the user" do
      expect(user.validate_user("password")).to be_truthy
    end
  end
end
