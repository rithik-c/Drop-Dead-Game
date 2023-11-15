require "test_helper"

class AutoDropDeadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auto_drop_dead = auto_drop_deads(:one)
  end

  test "should get index" do
    get auto_drop_deads_url
    assert_response :success
  end

  test "should get new" do
    get new_auto_drop_dead_url
    assert_response :success
  end

  test "should create auto_drop_dead" do
    assert_difference("AutoDropDead.count") do
      post auto_drop_deads_url, params: { auto_drop_dead: { dice_count: @auto_drop_dead.dice_count, game_history_id: @auto_drop_dead.game_history_id, player_count: @auto_drop_dead.player_count, sides: @auto_drop_dead.sides } }
    end

    assert_redirected_to auto_drop_dead_url(AutoDropDead.last)
  end

  test "should show auto_drop_dead" do
    get auto_drop_dead_url(@auto_drop_dead)
    assert_response :success
  end

  test "should get edit" do
    get edit_auto_drop_dead_url(@auto_drop_dead)
    assert_response :success
  end

  test "should update auto_drop_dead" do
    patch auto_drop_dead_url(@auto_drop_dead), params: { auto_drop_dead: { dice_count: @auto_drop_dead.dice_count, game_history_id: @auto_drop_dead.game_history_id, player_count: @auto_drop_dead.player_count, sides: @auto_drop_dead.sides } }
    assert_redirected_to auto_drop_dead_url(@auto_drop_dead)
  end

  test "should destroy auto_drop_dead" do
    assert_difference("AutoDropDead.count", -1) do
      delete auto_drop_dead_url(@auto_drop_dead)
    end

    assert_redirected_to auto_drop_deads_url
  end
end
