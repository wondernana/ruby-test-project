require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "should not accept post with empty title" do
    post = Post.new(title: "", body: "test body")
    assert post.invalid?
  end

  test "should not accept post with less than min size title" do
    post = Post.new(title: "12", body: "test body")
    assert post.invalid?
  end

  test "should accept post with min size title" do
    post = Post.new(title: "123", body: "test body")
    assert post.valid?
  end
end
