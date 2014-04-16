module ArticlesHelper

  def article_params
    params.required(:article).permit(:title, :body)
  end

end
