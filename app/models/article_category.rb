class ArticleCategory < ActiveRecord::Base
  attr_accessible :name, :status

  has_many :articles

  scope :active, where(:status => true).order("name ASC")
  scope :inactive, where(:status => false).order("name ASC")
end
