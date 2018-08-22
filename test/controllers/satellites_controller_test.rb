require 'test_helper'

class SatellitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @satellite = satellites(:one)
  end

  test "should get index" do
    get satellites_url
    assert_response :success
  end

  test "should get new" do
    get new_satellite_url
    assert_response :success
  end

  test "should create satellite" do
    assert_difference('Satellite.count') do
      post satellites_url, params: { satellite: { last_telemetry_timestamp: @satellite.last_telemetry_timestamp } }
    end

    assert_redirected_to satellite_url(Satellite.last)
  end

  test "should show satellite" do
    get satellite_url(@satellite)
    assert_response :success
  end

  test "should get edit" do
    get edit_satellite_url(@satellite)
    assert_response :success
  end

  test "should update satellite" do
    patch satellite_url(@satellite), params: { satellite: { last_telemetry_timestamp: @satellite.last_telemetry_timestamp } }
    assert_redirected_to satellite_url(@satellite)
  end

  test "should destroy satellite" do
    assert_difference('Satellite.count', -1) do
      delete satellite_url(@satellite)
    end

    assert_redirected_to satellites_url
  end
end
