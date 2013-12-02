class Page < ActiveRecord::Base
  attr_accessible :active, :content, :permalink, :title
  validates_uniqueness_of :permalink

  scope :active, lambda { where(published: true) }

  def to_param
    permalink
  end
end
