class ThreadForum < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  #before_filter :authenticate_user!,:except => [:index, :show]
  attr_accessible :body, :category_id, :is_deleted, :reputation_point, :status, :title, :user_id, :picture

  belongs_to :user
  has_one :categories
  validates :title, :body, :presence => true
  
  has_reputation :votes, source: :user, aggregated_by: :sum
end

