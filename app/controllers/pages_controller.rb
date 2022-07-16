class PagesController < ApplicationController
  def home
    @courses = Course.all.order("created_at DESC")
  end
end
