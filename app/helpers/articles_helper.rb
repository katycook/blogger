module ArticlesHelper

  def article_params
    params.required(:article).permit(:title, :body, :tag_list)
  end

end
