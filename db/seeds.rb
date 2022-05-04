# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
Product.destroy_all

product = Product.create([
    { name: "Grapes",
      price: 2,

    },
    {
        body: "Freshly picked watermelon straight from the ground",
        stock: 0,
        price: 0.1e2,
        image: "watermelon.png"
    }])
