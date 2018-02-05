# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Topics
# ###################################
topics = ["Frontend", "Backend", "Software Development", "Productivity"]
topics.each do |topic|
  Blog::Topic.create!(title: "#{topic}")
end


# Blog Posts
# ###################################
10.times do |post|
  Blog::Post.create!(
    title: "Blog Post #{post}' Title",
    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    topic_id: Blog::Topic.last.id
  )
end


# SKILLS
# ###################################
5.times do |skill|
  Skill.create!(
    title: "Skill's number #{skill}",
    percent_spent_on: 1
  )
end


# Portfolio Items
# ###################################
8.times do |portfolio_item|
  Portfolio.create!(
               title: "Portfolio number #{portfolio_item + 1}",
               subtitle: "Ruby On Rails",
               body:"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.",
               main_image: "http://via.placeholder.com/600x400",
               thumb_image: "http://via.placeholder.com/350x150"
  )
end


1.times do |portfolio_item|
  Portfolio.create!(
      title: "Portfolio number #{portfolio_item + 1}",
      subtitle: "React",
      body:"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.",
      main_image: "http://via.placeholder.com/600x400",
      thumb_image: "http://via.placeholder.com/350x150"
  )
end


# TECHNOLOGIES
# ###################################
technologies = ["JavaScript", "Ruby", "NodeJS", "Ruby On Rails"]
count = 0
=begin
technologies.each do |technology|
  Technology.create!(
                name: "#{technology}",
                portfolio_id: count += 1
  )
end
=end

technologies.each do |tech|
  Portfolio.find(count += 1).technologies.create!(
      name: "#{tech}"
      )
end


# ***************************************
# BOOKSHOP
# ***************************************

# AUTHORS
# ###################################
cal_newport = Bookshop::Author.create!(
    name: "Cal Newport", country: "United States",
    biography: "Cal Newport, is Sed ut perspiciatis unde omnis iste natus error sit voluptatem
     accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore
    veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam
    voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur.")
john_j_ratey = Bookshop::Author.create!(
    name: "John J. Ratey", country: "United States",
    biography: "John J. Ratey is Sed ut perspiciatis unde omnis iste natus error sit
    voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo
    inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam
     voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur.")
charles_duhigg = Bookshop::Author.create!(
    name: "Charles Duhigg", country: "United States",
    biography: "Charles Duhigg is Sed ut perspiciatis unde omnis iste natus error sit
    voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo
    inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim
    ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.")

# GENRES
# ###################################
fiction     = Bookshop::Genre.create!(name: "Fiction")
non_fiction = Bookshop::Genre.create!(name: "Non-Fiction")
biographies = Bookshop::Genre.create!(name: "Biographies")

# BOOKS
# ###################################
Bookshop::Book.create!(title: "Deep Work", genre_id: non_fiction.id, author_id: cal_newport.id, sales: 231)
Bookshop::Book.create!(title: "Spark", genre_id: fiction.id, author_id: john_j_ratey.id, sales: 132)
Bookshop::Book.create!(title: "The Power Of Habits", genre_id: biographies.id, author_id: charles_duhigg.id, sales: 32)
Bookshop::Book.create!(title: "So Good They Can't Ignore You", genre_id: non_fiction.id, author_id: cal_newport.id, sales: 563)