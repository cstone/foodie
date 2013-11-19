class Page < ActiveRecord::Base
  attr_accessible :active, :content, :permalink, :title

  def to_param
    permalink
  end
end
