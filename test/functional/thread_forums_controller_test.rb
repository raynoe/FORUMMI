require 'test_helper'

class ThreadForumsControllerTest < ActionController::TestCase
  setup do
    @thread_forum = thread_forums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thread_forums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thread_forum" do
    assert_difference('ThreadForum.count') do
      post :create, thread_forum: { body: @thread_forum.body, category_id: @thread_forum.category_id, is_deleted: @thread_forum.is_deleted, reputation_point: @thread_forum.reputation_point, status: @thread_forum.status, title: @thread_forum.title, user_id: @thread_forum.user_id }
    end

    assert_redirected_to thread_forum_path(assigns(:thread_forum))
  end

  test "should show thread_forum" do
    get :show, id: @thread_forum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @thread_forum
    assert_response :success
  end

  test "should update thread_forum" do
    put :update, id: @thread_forum, thread_forum: { body: @thread_forum.body, category_id: @thread_forum.category_id, is_deleted: @thread_forum.is_deleted, reputation_point: @thread_forum.reputation_point, status: @thread_forum.status, title: @thread_forum.title, user_id: @thread_forum.user_id }
    assert_redirected_to thread_forum_path(assigns(:thread_forum))
  end

  test "should destroy thread_forum" do
    assert_difference('ThreadForum.count', -1) do
      delete :destroy, id: @thread_forum
    end

    assert_redirected_to thread_forums_path
  end
end
