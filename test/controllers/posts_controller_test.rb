require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test "should get index" do
    get posts_url
    assert_response :success
    assert_match "Posts", @response.body
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference("Post.count") do
      post posts_url, params: { post: { body: @post.body, title: @post.title } }
    end
    assert_redirected_to post_url(Post.last)
    assert_equal "Post was successfully created.", flash[:notice]
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { title: "updated title" } }
    assert_redirected_to post_url(@post)
    @post.reload
    assert_equal "updated title", @post.title
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete post_url(@post)
    end
    assert_redirected_to posts_url
    assert_equal "Post was successfully destroyed.", flash[:notice]
  end
end
