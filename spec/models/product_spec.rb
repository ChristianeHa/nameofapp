require 'rails_helper'

describe Product do

	before do
		@product = Product.create!(name: "race bike")
		@user = User.create!(email: "maxmustermann@example.de", password: "Password")
		@product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
		@product.comments.create!(rating: 5, user: @user, body: "Good bike!")
		@product.comments.create!(rating: 3, user: @user, body: "Okay!")
	end

	it "returns the average rating of all comments" do
		expect(@product.average_rating).to eq 3.0
	end

	it "returns only a product description" do
		expect(Product.new(description: "Nice bike")).not_to be_valid
	end
	
end