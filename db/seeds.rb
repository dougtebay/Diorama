# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.all.clear
# Collection.all.clear
# Tweet.all.clear

user1 = User.create(user_name: "dannygilbs", email: "danielgilberg@gmail.com", password_digest: "learnlovecode")
user2 = User.create(user_name: "kimkardashian", email: "kimk@gmail.com", password_digest: "ilovekanye")
user3 = User.create(user_name: "northwest", email: "northwest@gmail.com", password_digest: "mymomiskim")

collection1 = user1.collections.build(name: "Funny Tweets", description: "Tweets that made me laugh")
collection2 = user2.collections.build(name: "Breaking News", description: "Tweets about the news")
collection3 = user3.collections.build(name: "Sports!", description: "Tweets about sports")



