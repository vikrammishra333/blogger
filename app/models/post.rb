class Post < ActiveRecord::Base

  validates :title, :presence => true
  validates :description, :presence => true

  belongs_to :users, :foreign_key => :user_id

end
