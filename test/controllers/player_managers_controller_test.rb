require "test_helper"

class PlayerManagersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player_manager = player_managers(:one)
  end

  test "should get index" do
    get player_managers_url
    assert_response :success
  end

  test "should get new" do
    get new_player_manager_url
    assert_response :success
  end

  test "should create player_manager" do
    assert_difference("PlayerManager.count") do
      post player_managers_url, params: { player_manager: {  } }
    end

    assert_redirected_to player_manager_url(PlayerManager.last)
  end

  test "should show player_manager" do
    get player_manager_url(@player_manager)
    assert_response :success
  end

  test "should get edit" do
    get edit_player_manager_url(@player_manager)
    assert_response :success
  end

  test "should update player_manager" do
    patch player_manager_url(@player_manager), params: { player_manager: {  } }
    assert_redirected_to player_manager_url(@player_manager)
  end

  test "should destroy player_manager" do
    assert_difference("PlayerManager.count", -1) do
      delete player_manager_url(@player_manager)
    end

    assert_redirected_to player_managers_url
  end
end
