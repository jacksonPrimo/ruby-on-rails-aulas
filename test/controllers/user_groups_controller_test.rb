require "test_helper"

class UserGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_group = user_groups(:one)
  end

  test "should get index" do
    get user_groups_url, as: :json
    assert_response :success
  end

  test "should create user_group" do
    assert_difference("UserGroup.count") do
      post user_groups_url, params: { user_group: { description: @user_group.description } }, as: :json
    end

    assert_response :created
  end

  test "should show user_group" do
    get user_group_url(@user_group), as: :json
    assert_response :success
  end

  test "should update user_group" do
    patch user_group_url(@user_group), params: { user_group: { description: @user_group.description } }, as: :json
    assert_response :success
  end

  test "should destroy user_group" do
    assert_difference("UserGroup.count", -1) do
      delete user_group_url(@user_group), as: :json
    end

    assert_response :no_content
  end
end
