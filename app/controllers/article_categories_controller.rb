class ArticleCategoriesController < ApplicationController
  # GET /article_categories
  # GET /article_categories.json
  def index
    @article_categories = ArticleCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @article_categories }
    end
  end

  # GET /article_categories/1
  # GET /article_categories/1.json
  def show
    @article_category = ArticleCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article_category }
    end
  end

  # GET /article_categories/new
  # GET /article_categories/new.json
  def new
    @article_category = ArticleCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article_category }
    end
  end

  # GET /article_categories/1/edit
  def edit
    @article_category = ArticleCategory.find(params[:id])
  end

  # POST /article_categories
  # POST /article_categories.json
  def create
    @article_category = ArticleCategory.new(params[:article_category])

    respond_to do |format|
      if @article_category.save
        format.html { redirect_to @article_category, notice: 'Article category was successfully created.' }
        format.json { render json: @article_category, status: :created, location: @article_category }
      else
        format.html { render action: "new" }
        format.json { render json: @article_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /article_categories/1
  # PUT /article_categories/1.json
  def update
    @article_category = ArticleCategory.find(params[:id])

    respond_to do |format|
      if @article_category.update_attributes(params[:article_category])
        format.html { redirect_to @article_category, notice: 'Article category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /article_categories/1
  # DELETE /article_categories/1.json
  def destroy
    @article_category = ArticleCategory.find(params[:id])
    @article_category.destroy

    respond_to do |format|
      format.html { redirect_to article_categories_url }
      format.json { head :no_content }
    end
  end
end
