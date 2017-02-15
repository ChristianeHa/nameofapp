class Product < ApplicationRecord
	has_many :orders

	def next
		Product.where("id > ?", id).first
	end

	def prev
		Product.where("id < ?", id).last
	end

	def self.search(search_term)
		if Rails.env.production?
        	@products = Product.where("name ilike ?", "%#{search_term}")
      	else
        	@products = Product.where("name LIKE ?", "%#{search_term}")
      	end
	end

end
