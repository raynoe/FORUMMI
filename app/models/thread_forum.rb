class ThreadForum < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  attr_accessible :body, :category_id, :is_deleted, :reputation_point, :status, :title, :user_id, :picture

  has_many :comments, :dependent => :destroy
  belongs_to :user
  has_one :categories

  validates :title, :presence => true
  validates :body, :presence => true, :length => { :minimum => 100}
  has_reputation :votes, source: :user, aggregated_by: :sum
end

