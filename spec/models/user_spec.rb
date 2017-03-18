require 'rails_helper'

describe User do

	it "returns only a password" do
		expect(User.new(password: "Password")).not_to be_valid
	end

	it "returns only an email" do
		expect(User.new(email: "piabauer@example.de")).not_to be_valid
	end

	it "sould not validate users without an email address" do
		@user = FactoryGirl.build(:user, email: "not_an_email")
		expect(@user).to_not be_valid
	end


end