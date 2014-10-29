# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
Product.create!(title: "Etsy, Inc.",
  description: 
    %{<p>
      Etsy is an e-commerce website focused on handmade 
      or vintage items and supplies, as well as unique factory-manufactured 
      items under Etsy's new guidelines, released in October 2013.
    </p>},
  image_url: "unknown.jpg",
  price: 270.25)