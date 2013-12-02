class ArticleCategory < ActiveRecord::Base
  attr_accessible :name, :status

  has_many :articles

  scope :active, where(:status => true).order("name ASC")
  scope :inactive, where(:status => false).order("name ASC")

  def long_title
    "#{name} - #{ArticleCategory.articles.count}"
  end
end
