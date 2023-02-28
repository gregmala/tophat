# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Product.destroy_all


Product.create(brand: "Gucci", size: "L", apparel_type: "T-shirt", category: "Men", price_per_cycle: "10€", color: "White", description: "White T-shirt", owner_id: User.all[0].id )
Product.create(brand: "Green Coast", size: "M", apparel_type: "Skirt", category: "Woman", price_per_cycle: "3€", color: "Red", description: "Red Mini Skirt", owner_id: User.all[1].id)
Product.create(brand: "Gucci", size: "S", apparel_type: "Dress", category: "Formal", price_per_cycle: "120€", color: "Blue", description: "Blue Party Dress", owner_id: User.all[2].id )
Product.create(brand: "ZaraKids", size: "S", apparel_type: "Jumpsuit", category: "Kids", price_per_cycle: "5€", color: "Purple", description: "Purple Jumpsuit for Boy", owner_id: User.all[2].id )




Booking.create(status: "Accepted", user_id: User.all[2].id, product_id: Product.all[0].id)
Booking.create(status: "Pending", user_id: User.all[0].id, product_id: Product.all[1].id)
Booking.create(status: "Declined", user_id: User.all[1].id, product_id: Product.all[2].id)
