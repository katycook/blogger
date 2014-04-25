class Statistics
  def total_articles
    Article.count
  end

  def total_comments
    Comment.count
  end

  def most_commented_article
    Article.all.sort_by { |a| a.comments.count }.last
  end

  def article_word_counts
    sum = 0
    Article.all.each { |a| sum += a.body.split.size}
    sum
  end

  def article_average_word_count
    sum = 0
    Article.all.each { |a| sum += a.body.split.size}
    1.0*sum/Article.count
  end

  def article_max_word_count
    Article.all.max_by { |a| a.body.split.size }.body.split.size
  end

  def article_min_word_count
    Article.all.min_by { |a| a.body.split.size }.body.split.size
  end

end