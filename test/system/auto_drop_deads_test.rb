require "application_system_test_case"

class AutoDropDeadsTest < ApplicationSystemTestCase
  setup do
    @auto_drop_dead = auto_drop_deads(:one)
  end

  test "visiting the index" do
    visit auto_drop_deads_url
    assert_selector "h1", text: "Auto drop deads"
  end

  test "should create auto drop dead" do
    visit auto_drop_deads_url
    click_on "New auto drop dead"

    fill_in "Dice count", with: @auto_drop_dead.dice_count
    fill_in "Game history", with: @auto_drop_dead.game_history_id
    fill_in "Player count", with: @auto_drop_dead.player_count
    fill_in "Sides", with: @auto_drop_dead.sides
    click_on "Create Auto drop dead"

    assert_text "Auto drop dead was successfully created"
    click_on "Back"
  end

  test "should update Auto drop dead" do
    visit auto_drop_dead_url(@auto_drop_dead)
    click_on "Edit this auto drop dead", match: :first

    fill_in "Dice count", with: @auto_drop_dead.dice_count
    fill_in "Game history", with: @auto_drop_dead.game_history_id
    fill_in "Player count", with: @auto_drop_dead.player_count
    fill_in "Sides", with: @auto_drop_dead.sides
    click_on "Update Auto drop dead"

    assert_text "Auto drop dead was successfully updated"
    click_on "Back"
  end

  test "should destroy Auto drop dead" do
    visit auto_drop_dead_url(@auto_drop_dead)
    click_on "Destroy this auto drop dead", match: :first

    assert_text "Auto drop dead was successfully destroyed"
  end
end
