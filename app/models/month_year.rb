class MonthYear < ActiveRecord::Base
  has_many :articles

  def in_words
    [Date::MONTHNAMES[self.month], self.year].join(" ") 
  end
end
