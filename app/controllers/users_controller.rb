class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @articles = Article.where(:user_id => current_user.id).all
  end

end