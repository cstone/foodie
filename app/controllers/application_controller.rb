class ApplicationController < ActionController::Base

  before_filter :get_recent_featured

  def forem_user
    current_user
  end

  helper_method :forem_user

  protect_from_forgery

  def get_recent_featured
    @recent_featured_articles = Article.recent_featured
  end
end
