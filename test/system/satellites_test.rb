require "application_system_test_case"

class SatellitesTest < ApplicationSystemTestCase
  setup do
    @satellite = satellites(:one)
  end

  test "visiting the index" do
    visit satellites_url
    assert_selector "h1", text: "Satellites"
  end

  test "creating a Satellite" do
    visit satellites_url
    click_on "New Satellite"

    fill_in "Last Telemetry Timestamp", with: @satellite.last_telemetry_timestamp
    click_on "Create Satellite"

    assert_text "Satellite was successfully created"
    click_on "Back"
  end

  test "updating a Satellite" do
    visit satellites_url
    click_on "Edit", match: :first

    fill_in "Last Telemetry Timestamp", with: @satellite.last_telemetry_timestamp
    click_on "Update Satellite"

    assert_text "Satellite was successfully updated"
    click_on "Back"
  end

  test "destroying a Satellite" do
    visit satellites_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Satellite was successfully destroyed"
  end
end
