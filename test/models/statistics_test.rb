require 'test_helper'

class StatisticsTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "total articles returns a count of all the articles for the blog" do
    Article.create title: "First", body: "Body"
    Article.create title: "Second", body: "Body"
    stats = Statistics.new
    assert_equal 2, stats.total_articles
  end

  test "total comments returns a count of all the comments for the blog" do
    article = Article.create title: "First", body: "Body"
    article.comments.create author_name: "Commenter", body: "new Comment"

    stats = Statistics.new
    assert_equal 1, stats.total_comments
  end

  test "find the article with the most comments" do
    a1 = Article.create title: "Zero", body: "Body"
    a2 = Article.create title: "Lots", body: "Body"
    a2.comments.create author_name: "commenter", body: "new comment"

    stats = Statistics.new
    assert_equal a2, stats.most_commented_article
  end

  test "article word counts returns sum of all article lengths" do
    s1 = "a few words"
    s2 = ""
    s3 = "and some more !!!"
    a1 = Article.create title: "t", body: s1
    a2 = Article.create title: "t", body: s2
    a3 = Article.create title: "t", body: s3

    value = [s1,s2,s3].join(' ').split.size
    stats = Statistics.new
    assert_equal value, stats.article_word_counts
  end

  test "article average word count returns the avg number of words per article" do
    s1 = "a few words"
    s2 = ""
    s3 = "and some more !!!"
    a1 = Article.create title: "t", body: s1
    a2 = Article.create title: "t", body: s2
    a3 = Article.create title: "t", body: s3

    value = [s1,s2,s3].join(' ').split.size/3.0
    stats = Statistics.new
    assert_equal value, stats.article_average_word_count
  end

  test "article max word count returns the greatest number of words in a single article" do
    s1 = "a few words"
    s2 = ""
    s3 = "and some more !!!"
    a1 = Article.create title: "t", body: s1
    a2 = Article.create title: "t", body: s2
    a3 = Article.create title: "t", body: s3

    value = 4
    stats = Statistics.new
    assert_equal value, stats.article_max_word_count
  end

  test "article min word count returns the least number of words in a single article" do
    s1 = "a few words"
    s2 = ""
    s3 = "and some more !!!"
    a1 = Article.create title: "t", body: s1
    a2 = Article.create title: "t", body: s2
    a3 = Article.create title: "t", body: s3

    value = 0
    stats = Statistics.new
    assert_equal value, stats.article_min_word_count
  end

end