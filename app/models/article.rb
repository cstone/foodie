class Article < ActiveRecord::Base
  attr_accessible :body, :published, :title, :user_id, :featured, :tag_list, :article_image, :article_category_id
  acts_as_taggable
  acts_as_punchable

  mount_uploader :article_image, ArticleImageUploader

  validates_presence_of :title, :body, :article_category
  validates_uniqueness_of :title
  validates :user_id, :presence => true

  belongs_to :user
  belongs_to :article_category

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
  scope :featured_posts, featured.order('created_at DESC')



  def to_param
   "#{id}-#{title.gsub(/[ ]+/i, '-')}"
  end


  def self.search(search)
    if search
      #find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
      where("title LIKE :search OR body LIKE :search", {:search => "%#{search}%"})
    else
      find(:all)
    end
  end





  # Helpers
  def posts_by(author)
    @recent_posts.where(:author => author)
  end

  def posts_in(category)
    @recent_posts.where(:category => category)
  end
end
