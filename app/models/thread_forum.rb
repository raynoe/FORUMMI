class ThreadForum < ActiveRecord::Base
  #before_filter :authenticate_user!,:except => [:index, :show]
  attr_accessible :body, :category_id, :is_deleted, :reputation_point, :status, :title, :user_id
end

