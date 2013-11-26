class Article < ActiveRecord::Base
  attr_accessible :body, :published, :title, :user_id, :featured, :tag_list
  acts_as_taggable
  acts_as_punchable

  validates_presence_of :title, :body
  validates_uniqueness_of :title
  validates :user_id, :presence => true

  belongs_to :user

  default_scope -> { order('created_at DESC') }


  #scope :published, lambda { where('published_at IS NOT NULL AND published_at <= ?', Time.now) }
  scope :published, lambda { where(published: true) }
  scope :draft, lambda { where(published: false) }
  scope :featured, lambda { where(featured: true)}
  scope :recent_featured, featured.limit(3)
  scope :recent, published.order(:created_at).limit(10)
  scope :recent_posts, published.order('created_at DESC').limit(5)
  scope :author,   proc {|author| where(:author => author) }
  scope :category, proc {|category| where(:category => category) }
  scope :featuredposts, featured.order('created_at DESC')



  def to_param
   "#{id}-#{title.gsub(/[ ]+/i, '-')}"
  end



  # Helpers
  def posts_by(author)
    @recent_posts.where(:author => author)
  end

  def posts_in(category)
    @recent_posts.where(:category => category)
  end
end
