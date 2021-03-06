class Article < ActiveRecord::Base
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  belongs_to :month_year

  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",")
    tag_names = tag_names.collect{|s| s.strip.downcase}
    tag_names = tag_names.uniq

    new_or_found_tags = tag_names.collect{|name| Tag.find_or_create_by(name: name)}

    self.tags = new_or_found_tags
  end

  def increment_view_count
    self.view_count += 1
    self.save
  end

end
