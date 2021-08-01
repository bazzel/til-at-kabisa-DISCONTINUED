# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

Post.delete_all
Author.delete_all
Channel.delete_all

25.times do
  Author.create(name: Faker::Name.unique.name)
  Channel.create(name: Faker::ProgrammingLanguage.name)
end

1000.times do |n|
  channel = Channel.all.shuffle.sample
  author = Author.all.shuffle.sample

  Post.create(
    title: Faker::Quote.famous_last_words,
    body: Faker::Lorem.paragraphs(number: 4).map { |pr| "<p>#{pr}</p>" }.join,
    channel: channel,
    author: author,
    created_at: n.days.ago
  )
end
