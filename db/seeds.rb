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
  Topic.create!(title: "#{topic}")
end


# Blog Posts
# ###################################
10.times do |post|
  Post.create!(
    title: "Blog Post #{post}' Title",
    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    topic_id: Topic.last.id
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
9.times do |portfolio_item|
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

# GENRES
# ###################################
genres = ["Fantasy", "Programming", "Self-help", "Novel", "Psychology"]
genres.each do |genre|
  Bookshop::Genre.create!(name: "#{genre}")
end

# AUTHORS
# ###################################
3.times do |author|
  Bookshop::Author.create!(
      name:"Author n°#{author + 1}",
      alias: "Author n°#{author + 1}'s Alias",
      country: "His Country",
      biography: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt."
  )
end

# BOOKS
# ###################################
3.times do |book|
  Bookshop::Book.create!(
      title: "Book n°#{book}",
      year: 2012,
      summary: "
Never Split the Difference: Negotiating as if Your Life Depended on It (Anglais) Broché – 23 mars 2017
"
  )
end