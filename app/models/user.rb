class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  has_many :articles, :order => 'published_at DESC, title ASC',
           :dependent => :nullify
  has_one :profile


  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :presence => true,
            :length => { :maximum => 50 }
  validates :email, :presence => true,
            :format => { :with => email_regex },
            :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true,
            :confirmation => true,
            :length => { :within => 6..40 }


  # SEO Friendly URLs
  def to_param
    "#{id}-#{name.gsub(/[ ]+/i, '-')}"
  end

  def to_s
    name
  end
end
