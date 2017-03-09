class Product < ApplicationRecord

	has_many :orders
	has_many :comments

	validates :name, presence: true

	def next
		Product.where("id > ?", id).first
	end

	def prev
		Product.where("id < ?", id).last
	end

	def self.search(search_term)
		if Rails.env.production?
        	@products = Product.where("name ilike ?", "%#{search_term}%")
      	else
        	@products = Product.where("name LIKE ?", "%#{search_term}%")
      	end
	end

	def highest_rating_comment
  		comments.rating_desc.first
	end

	def lowest_rating_comment
  		comments.rating_desc.last
	end

	def average_rating
  		comments.average(:rating).to_f
	end

end
