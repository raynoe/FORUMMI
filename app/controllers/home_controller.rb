class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
  	@thread_forums = ThreadForum.all
  end
end
