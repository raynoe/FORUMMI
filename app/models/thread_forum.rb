class ThreadForum < ActiveRecord::Base
  #before_filter :authenticate_user!,:except => [:index, :show]
  attr_accessible :body, :category_id, :is_deleted, :reputation_point, :status, :title, :user_id

  belongs_to :user

  validates :title, :body, :presence => true
  
  has_reputation :votes, source: :user, aggregated_by: :sum
end

