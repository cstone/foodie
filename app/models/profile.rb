class Profile < ActiveRecord::Base
  attr_accessible :about, :birthday, :facebook, :location, :twitter, :user_id

  belongs_to :user
end
