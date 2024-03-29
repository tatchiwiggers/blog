# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

file = URI.open('https://source.unsplash.com/random')
article = Article.new(title: 'A random picture', body: "A great picture")
article.photo.attach(io: file, filename: 'random.png', content_type: 'image/png')
article.save!