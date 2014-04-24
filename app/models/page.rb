class Page < ActiveRecord::Base
  def to_param
    slug
  end

  def self.find(slug)
    find_by_slug(slug)
  end
end
