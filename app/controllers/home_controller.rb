class HomeController < ApplicationController
  def index
    @articles = Article.order('created_at DESC').limit(10).reverse
    @count_articles = Article.count
  end

  def parse
    articles = Parser.parse_vc
    Article.save_from_hashes(articles)
    respond_to do |format|
      format.html {redirect_to root_url}
    end
  end
end
