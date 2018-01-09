class PagesController < ApplicationController
  def home
    @posts = Post.all
    @skills = Skill.all
  end

  def contact
  end

  def about
  end
end
