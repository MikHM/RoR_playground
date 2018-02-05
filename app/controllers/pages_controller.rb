class PagesController < ApplicationController
  def home
    @posts = Blog::Post.all
    @skills = Skill.all
  end

  def contact
  end

  def about
  end
end
