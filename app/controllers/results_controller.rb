class ResultsController < ApplicationController
  def index
    #@articles = Article.where(:user_id => current_user.id).order('created_at DESC')
    @articles = Article.search(params[:search])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end

  end
end
