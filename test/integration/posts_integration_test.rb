require "test_helper"

class PostsIntegrationTest < ActionDispatch::IntegrationTest
  test "can create new post" do
    new_post = Post.new(title: "New post title", body: "New post body")

    get new_post_path
    assert_response :success

    assert_difference("Post.count") do
    post posts_path, params: { post: { title: new_post.title, content: new_post.body } }
    end
    assert_response :redirect

    follow_redirect!
    assert_response :success 
    assert_select "h1", new_post.title
  end

  test "can delete existing post" do
    existing_post = posts(:one)

    get post_url(existing_post)
    assert_response :success

    assert_difference("Post.count", -1) do
        delete post_url(existing_post)
    end
    assert_response :redirect

    follow_redirect!
    assert_response :success
    assert_no_match existing_post.title, @response.body
    assert_no_match existing_post.body, @response.body
  end
end