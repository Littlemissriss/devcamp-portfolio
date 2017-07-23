class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @skills = Skill.all
  end

  def about
    @skills = Skill.all.order(percent_utilized: :desc)
  end

  def contact
  end
end
