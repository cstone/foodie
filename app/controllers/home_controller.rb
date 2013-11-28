class HomeController < ApplicationController
  def index
    @articles = Article.featured_posts.order('created_at DESC').page(params[:page]).per(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end
end
