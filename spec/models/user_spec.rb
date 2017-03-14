require 'rails_helper'

describe User do

	it "returns only a password" do
		expect(User.new(password: "Password")).not_to be_valid
	end

	it "returns only an email" do
		expect(User.new(email: "maxmustermann@web.de")).not_to be_valid
	end


end