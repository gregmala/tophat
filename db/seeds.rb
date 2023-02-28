# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# User.destroy_all
# Product.destroy_all



Booking.create(status: "Accepted", user_id: User.all[2].id, product_id: Product.all[0].id)
Booking.create(status: "Pending", user_id: User.all[0].id, product_id: Product.all[1].id)
Booking.create(status: "Declined", user_id: User.all[1].id, product_id: Product.all[2].id)
