require "test_helper"

class ProtectiveCatsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get protective_cats_new_url
    assert_response :success
  end

  test "should get index" do
    get protective_cats_index_url
    assert_response :success
  end

  test "should get show" do
    get protective_cats_show_url
    assert_response :success
  end

  test "should get edit" do
    get protective_cats_edit_url
    assert_response :success
  end
end
