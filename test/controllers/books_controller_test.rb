require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get books_create_url
    assert_response :success
  end

  test "should get update" do
    get books_update_url
    assert_response :success
  end

  test "should get delete" do
    get books_delete_url
    assert_response :success
  end

end
