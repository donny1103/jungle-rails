# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'
cat4 = Category.find_or_create_by! name: 'Sports'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
})

cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})

cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 0,
  price: 34.49
})

cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})

cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 8,
  price: 1_225.00
})

cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
})


cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
})

cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 3,
  price: 26.00
})

cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 32,
  price: 2_026.29
})

cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})

cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 2,
  price: 987.65
})

cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 23,
  price: 2_483.75
})

cat4.products.create!({
  name:  'The Surfer Snowboard 2019',
  description: 'For being so new to the scene, the surfer boards from Bataleon have made a name for themselves quickly. The Bataleon The Surfer Snowboard will turn off piste riding into a real surf-like experience thanks to a directional swallow-tail shape that works in conjunction with triple base technology for the ultimate white wave experience. With loads of fun to be had both in and out of the resort, this is a no brainer for your quiver this season.',
  image: open_asset('snowboard1.jpg'),
  quantity: 7,
  price: 799.95
})

cat4.products.create!({
  name:  'GNU Spasym Snowboard 2019',
  description: "Forest Bailey is at it again with the all new GNU Spasym Snowboard. This time focusing on the big mountain, side country lines you've been eyeing. Its C3 camber is perfect for technical run ins and powering out of turns while an aspen/paulownia core packs the power for you to make big hits and put 'em to your feet with confidence. Sporting an asymmetrical geometry the GNU Spasym Snowboard brings Forest's distinguished freestyle flair to big, freeride terrain.",
  image: open_asset('snowboard4.jpg'),
  quantity: 5,
  price: 599.95
})

cat4.products.create!({
  name:  'CAPiTA Spring Break Twin Snowboard 2019',
  description: "Grab a CAPiTA Spring Break Twin, some swim trunks and get ready for a good time. This board was made for the wild souls out there who get sendy in the park and carve with unmatched style. The asymmetrical sidecut balances out the natural unevenness of the body and makes for a consistent ride from edge to edge. Glide on powder and charge through the park with the satisfying Shovelhead tip and All-Terrain V2 profile that gives you the best of both worlds - camber for power and flat to rockered zones for float and playfulness. Get yourself into some trouble this spring break with the CAPiTA Spring Break Twin Snowboard.",
  image: open_asset('snowboard3.jpg'),
  quantity: 2,
  price: 499.95
})
cat4.products.create!({
  name:  'Bataleon Party Wave Snowboard 2019',
  description: "he Bataleon Party Wave Snowboard is your ticket to the white room. Choose this short-wide board 5cm-10cm shorter than your normal all-mountain board and enjoy the ride! You won't miss a beat, on or off piste, thanks to triple base shaping and SideKick technology for improved float and turn initiation. Whether you're digging trenches or slashing the white wave, there's no stopping this party.",
  image: open_asset('snowboard2.jpg'),
  quantity: 3,
  price: 399.95
})


User.create!({
  first_name:"Teri",
  last_name: "Harrison",
  email: "uer1@jungle.com",
  password:"123456"
})

User.create!({
  first_name: "Lee",
  last_name: "Arnold",
  email: "uer2@jungle.com",
  password:"123456"
})

r1 = Product.find_by! id: 1
r2 = Product.find_by! id: 2

r1.reviews.create!({
  user_id: 1,
  description: "don't buy it bad",
  rating: 0
})

r2.reviews.create!({
  user_id: 2,
  description: "return it",
  rating: 2
})

puts "DONE!"
