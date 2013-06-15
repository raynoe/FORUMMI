class HomeController < ApplicationController
  def index
  	@home = ThreadForum.all
  end
end
