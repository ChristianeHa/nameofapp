require 'rails_helper'

describe Comment do

	it "returns only a description" do
		expect(Comment.new(body: "Nice bike!")).not_to be_valid
	end

	it "returns only a rating" do
		expect(Comment.new(rating: "5")).not_to be_valid
	end


end