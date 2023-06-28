require "test_helper"

class StrayCatsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get stray_cats_new_url
    assert_response :success
  end

  test "should get index" do
    get stray_cats_index_url
    assert_response :success
  end

  test "should get show" do
    get stray_cats_show_url
    assert_response :success
  end

  test "should get edit" do
    get stray_cats_edit_url
    assert_response :success
  end
end
