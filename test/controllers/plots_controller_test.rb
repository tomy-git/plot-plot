require 'test_helper'

class PlotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get plots_index_url
    assert_response :success
  end

  test "should get show" do
    get plots_show_url
    assert_response :success
  end

  test "should get new" do
    get plots_new_url
    assert_response :success
  end

  test "should get create" do
    get plots_create_url
    assert_response :success
  end

  test "should get edit" do
    get plots_edit_url
    assert_response :success
  end

  test "should get update" do
    get plots_update_url
    assert_response :success
  end

  test "should get destroy" do
    get plots_destroy_url
    assert_response :success
  end

end
