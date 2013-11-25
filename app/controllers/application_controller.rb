class ApplicationController < ActionController::Base

  before_filter :get_recent_featured, :most_popular_articles

  def forem_user
    current_user
  end

  helper_method :forem_user

  protect_from_forgery


  def get_recent_featured
    @recent_featured_articles = Article.recent_featured
  end

  def most_popular_articles
   @most_popular_articles = Article.most_hit(1.day.ago, 5)
  end
end
