class Comment < ActiveRecord::Base
  attr_accessible :body, :thread_forum_id
  
  belongs_to :thread_forum
  belongs_to :user
end
