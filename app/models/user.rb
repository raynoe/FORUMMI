class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_many :thread_forum

  has_many :evaluations, class_name: "ReputationSystem::Evaluation", as: :source

  def voted_for?(thread_forum)
    evaluations.where(target_type: thread_forum.class, target_id: thread_forum.id).present?
  end

end
