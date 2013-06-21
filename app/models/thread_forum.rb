class ThreadForum < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  #before_filter :authenticate_user!,:except => [:index, :show]
  attr_accessible :body, :category_id, :is_deleted, :reputation_point, :status, :title, :user_id, :picture

<<<<<<< HEAD
=======
  has_many :comments, :dependent => :destroy
>>>>>>> ae02530c3f14bc5db2cf1aa1e56e47bfc691b0ac
  belongs_to :user
  has_one :categories
  validates :title, :body, :presence => true
  
  has_reputation :votes, source: :user, aggregated_by: :sum
end

