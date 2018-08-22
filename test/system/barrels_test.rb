require "application_system_test_case"

class BarrelsTest < ApplicationSystemTestCase
  setup do
    @barrel = barrels(:one)
  end

  test "visiting the index" do
    visit barrels_url
    assert_selector "h1", text: "Barrels"
  end

  test "creating a Barrel" do
    visit barrels_url
    click_on "New Barrel"

    fill_in "Barrel Errors", with: @barrel.barrel_errors
    fill_in "Last Flavor Sensor Result", with: @barrel.last_flavor_sensor_result
    fill_in "Satellite", with: @barrel.satellite_id
    fill_in "Status", with: @barrel.status
    click_on "Create Barrel"

    assert_text "Barrel was successfully created"
    click_on "Back"
  end

  test "updating a Barrel" do
    visit barrels_url
    click_on "Edit", match: :first

    fill_in "Barrel Errors", with: @barrel.barrel_errors
    fill_in "Last Flavor Sensor Result", with: @barrel.last_flavor_sensor_result
    fill_in "Satellite", with: @barrel.satellite_id
    fill_in "Status", with: @barrel.status
    click_on "Update Barrel"

    assert_text "Barrel was successfully updated"
    click_on "Back"
  end

  test "destroying a Barrel" do
    visit barrels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Barrel was successfully destroyed"
  end
end
