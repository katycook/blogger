class Page < ActiveRecord::Base

  before_save :initialize_order_and_slug

  def to_param
    slug
  end

  def self.find(slug)
    find_by_slug(slug)
  end


    def initialize_order_and_slug
      self.order ||= Page.all.max_by {|p| p.order}.order+1
      if self.slug.empty?
        self.slug = ["slug",Page.last.id+1].join('-')
      end
    end

end
