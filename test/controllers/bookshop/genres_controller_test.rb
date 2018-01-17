require 'test_helper'

class Bookshop::GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bookshop_genres_index_url
    assert_response :success
  end

  test "should get show" do
    get bookshop_genres_show_url
    assert_response :success
  end

  test "should get create" do
    get bookshop_genres_create_url
    assert_response :success
  end

  test "should get destroy" do
    get bookshop_genres_destroy_url
    assert_response :success
  end

end
