class Category < ActiveRecord::Base
  attr_accessible :name
  belongs_to :thread_forum
end
