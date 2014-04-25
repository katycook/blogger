class ArticlesController < ApplicationController
  include ArticlesHelper

  before_filter :require_login, except: [:index, :show]

  def index
    @articles = Article.all
    @pages = Page.all
  end

  def show
    article = Article.find(params[:id])

    @comment = Comment.new
    @comment.article_id = @article_id

    article.increment_view_count
  end

  def article
    @cached_article ||= Article.find_or_initialize_by(id: params[:id])
  end

  helper_method :article

  def create
    @article = Article.new(article_params)
    @article.save
    
    @my = MonthYear.where(:month => @article.created_at.month, :year => @article.created_at.year).first_or_create

    @article.month_year_id = @my.id
    @article.save
    
    flash.notice = "Article '#{@article.title}' Updated!"
    redirect_to article_path(@article)
  end


  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"
    redirect_to article_path(@article)
  end

  def destroy
    article.destroy

    flash.notice = "Article destroyed."
    redirect_to articles_path
  end

end
