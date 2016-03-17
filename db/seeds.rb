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

user1 = User.create(user_name: "kanyewest", email: "kanye@gmail.com", password_digest: "learnlovecode")
user2 = User.create(user_name: "kimkardashian", email: "kimk@gmail.com", password_digest: "ilovekanye")
user3 = User.create(user_name: "north", email: "northwest@gmail.com", password_digest: "mymomiskim")


collection1 = user1.collections.build(name: "Funny Tweets", description: "Tweets that made me laugh")
collection2 = user1.collections.build(name: "Sports!", description: "Tweets about sports")
collection3 = user2.collections.build(name: "Breaking News", description: "Tweets about the news")


tweet1 = collection1.tweets.build(user_name: 'Samntha Bee' , user_handle: "samanthaBee" , text: "Watch my show!" , date: '2016-03-17')
tweet2 = collection1.tweets.build(user_name: 'Bette Midler' , user_handle: 'BetteMidler' , text: 'Here is something funny' , date: '2016-03-14' )
tweet3 = collection1.tweets.build(user_name: 'Anna Kendrick' , user_handle: '@AnnaKendrick43' , text: 'I made a joke!' , date: '2016-03-10' )
tweet4 = collection2.tweets.build(user_name: 'Arsenal' , user_handle: 'Arsenal' , text: 'Goal!!' , date: '2016-03-15' )
tweet5 = collection2.tweets.build(user_name: 'Flyers' , user_handle: 'NHLFlyers' , text: 'We beat the Penguins!' , date: '2016-03-14' )
tweet6 = collection2.tweets.build(user_name: 'USSoccer' , user_handle: 'ussoccer' , text: 'world cup champions!' , date: '2016-03-10')
tweet7 = collection3.tweets.build(user_name: 'CNN' , user_handle: 'CNN' , text: 'Trump wins Florida', date: '2016-03-10')
tweet8 = collection3.tweets.build(user_name: 'NYTimes' , user_handle: 'nytimes' , text: 'Obama endorses Clinton' , date: '2016-02-10')
tweet9 = collection3.tweets.build(user_name: 'BBC', user_handle: 'bbc', text: 'David Cameron calls Obama' , date: '2016-01-19')










