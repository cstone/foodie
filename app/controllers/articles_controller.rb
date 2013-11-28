class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json

  before_filter :authenticate_user!, :except => [:show, :index]
  #before_filter :authorized_user, :only => [:destroy,:edit ]
  before_filter :get_user
  before_filter :require_permission, only: [:edit, :destroy]



  def index
    #@articles = Article.where(:user_id => current_user.id).order('created_at DESC')
    if params[:tag]
      @articles = Article.tagged_with(params[:tag]).page(params[:page]).per(5)
    else
      @articles = Article.order('created_at DESC').page(params[:page]).per(5)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    @article.punch(request)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    #@article = Article.where(:user_id => current_user.id).new
    @article = @user.articles.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    #@article = Article.find(params[:id])
    @article = Article.where(:user_id => current_user.id).find(params[:id])

  end

  # POST /articles
  # POST /articles.json
  def create
    #@article = @user.articles.build(params[:article])
    #@article = Article.new(params[:article])
    #@article.user_id = current_user.id
    @article = current_user.articles.build(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    #@article = Article.find(params[:id])
    #@article = current_user.articles.update_attributes(params[:article])
    @article = Article.where(:user_id => current_user.id).find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.where(:user_id => current_user.id).find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end



 private
  # Get the current user
  def get_user
    @user = current_user
  end


  def require_permission
    if current_user != Article.find(params[:id]).user
      redirect_to article_path
    end
  end


  def get_recent_articles
    @recentarticles = Article.recent_posts
  end

  #def authorized_user
  #  @article = current_user.articles.find_by_id(params[:id])
  #  redirect_to root_path if @article.nil?
  #end



end
