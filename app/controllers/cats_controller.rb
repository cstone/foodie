class CatsController < ApplicationController
  def index
    @cats = ArticleCategory.search(params[:articlecategory])
  end
end
