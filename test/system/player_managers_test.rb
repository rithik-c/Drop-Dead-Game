require "application_system_test_case"

class PlayerManagersTest < ApplicationSystemTestCase
  setup do
    @player_manager = player_managers(:one)
  end

  test "visiting the index" do
    visit player_managers_url
    assert_selector "h1", text: "Player managers"
  end

  test "should create player manager" do
    visit player_managers_url
    click_on "New player manager"

    click_on "Create Player manager"

    assert_text "Player manager was successfully created"
    click_on "Back"
  end

  test "should update Player manager" do
    visit player_manager_url(@player_manager)
    click_on "Edit this player manager", match: :first

    click_on "Update Player manager"

    assert_text "Player manager was successfully updated"
    click_on "Back"
  end

  test "should destroy Player manager" do
    visit player_manager_url(@player_manager)
    click_on "Destroy this player manager", match: :first

    assert_text "Player manager was successfully destroyed"
  end
end
