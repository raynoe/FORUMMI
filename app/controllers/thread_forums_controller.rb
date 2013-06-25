class ThreadForumsController < ApplicationController
  before_filter :authenticate_user!
  def index
     @thread_forums = ThreadForum.find_with_reputation(:votes, :all, order: "votes desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @thread_forums }
    end
  end

  # GET /thread_forums/1
  # GET /thread_forums/1.json
  def show
    @thread_forum = ThreadForum.find(params[:id])
    @comment = @thread_forum.comments.build
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @thread_forum }
    end
  end

  # GET /thread_forums/new
  # GET /thread_forums/new.json
  def new
    @thread_forum = ThreadForum.new (params[:thread_forum])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @thread_forum }
    end
  end

  # GET /thread_forums/1/edit
  def edit
    @thread_forum = ThreadForum.find(params[:id])
  end

  # POST /thread_forums
  # POST /thread_forums.json
  def create
    @thread_forum = ThreadForum.new(params[:thread_forum])

    respond_to do |format|
      if @thread_forum.save
        format.html { redirect_to @thread_forum, notice: 'Thread forum was successfully created.' }
        format.json { render json: @thread_forum, status: :created, location: @thread_forum }
      else
        format.html { render action: "new" }
        format.json { render json: @thread_forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /thread_forums/1
  # PUT /thread_forums/1.json
  def update
    @thread_forum = ThreadForum.find(params[:id])

    respond_to do |format|
      if @thread_forum.update_attributes(params[:thread_forum])
        format.html { redirect_to @thread_forum, notice: 'Thread forum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @thread_forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thread_forums/1
  # DELETE /thread_forums/1.json
  def destroy
    @thread_forum = ThreadForum.find(params[:id])
    @thread_forum.destroy

    respond_to do |format|
      format.html { redirect_to thread_forums_url }
      format.json { head :no_content }
    end
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @thread_forum = ThreadForum.find(params[:id])
    @thread_forum.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank you for voting"
  end

end
