# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create(:name => "City Bike", :description => "Light and reliable city cruiser model", :colour => "black", :price => "50", :image_url => "bike1.jpg")
Product.create(:name => "Classic White Bike", :description => "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.", :colour => "white", :price => "50

	78", :image_url => "bike3.jpg")
Product.create(:name => "Red City Bike", :description => "Elegant city bike for ladies.", :colour => "red", :price => "50", :image_url => "bike2.jpg")
Product.create(:name => "Classic Bike", :description => "Bike for trendy people.", :colour => "yellow", :price => "55", :image_url => "bike4.jpg")
Product.create(:name => "White City Bike", :description => "Cool city bike for women.", :colour => "white", :price => "100", :image_url => "bike5.jpg")
Product.create(:name => "City hopper", :description => "Stylish city bike in sky blue.", :colour => "blue", :price => "70", :image_url => "bike6.jpg")


User.create(:first_name => "Max", :last_name => "Mustermann", :email => "maxmustermann@example.de", :encrypted_password => "Christiane", :admin => "true")


Comment.create!(user: User.first, product: Product.first, rating: 1, body: "bad")
Comment.create!(user: User.first, product: Product.first, rating: 4, body: "nice")
Comment.create!(user: User.first, product: Product.first, rating: 2, body: "meh")