# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Detroying all lists"
List.destroy_all

puts "Detroying all bookmarks"
Bookmark.destroy_all

puts "Detroying all movies"
Movie.destroy_all

puts "Creating new movies"
10.times do
  movie = Movie.create!(title: Faker::Movie.title,
                        overview: Faker::Lorem.sentence,
                        poster_url: Faker::Internet.url,
                        rating: rand(1..10))
  movie.save
end

puts "Creating new lists"
List.create!(name: "Drama")
List.create!(name: "Comedy")
List.create!(name: "To rewatch")

puts "Creating new bookmarks"
Bookmark.create!(comment: "Recommended by John", movie: Movie.first, list: List.first)
