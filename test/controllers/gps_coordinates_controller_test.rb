require 'test_helper'

class GpsCoordinatesControllerTest < ActionController::TestCase
  setup do
    @gps_coordinate = gps_coordinates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gps_coordinates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gps_coordinate" do
    assert_difference('GpsCoordinate.count') do
      post :create, gps_coordinate: { device_id: @gps_coordinate.device_id, latitude: @gps_coordinate.latitude, longitude: @gps_coordinate.longitude }
    end

    assert_redirected_to gps_coordinate_path(assigns(:gps_coordinate))
  end

  test "should show gps_coordinate" do
    get :show, id: @gps_coordinate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gps_coordinate
    assert_response :success
  end

  test "should update gps_coordinate" do
    patch :update, id: @gps_coordinate, gps_coordinate: { device_id: @gps_coordinate.device_id, latitude: @gps_coordinate.latitude, longitude: @gps_coordinate.longitude }
    assert_redirected_to gps_coordinate_path(assigns(:gps_coordinate))
  end

  test "should destroy gps_coordinate" do
    assert_difference('GpsCoordinate.count', -1) do
      delete :destroy, id: @gps_coordinate
    end

    assert_redirected_to gps_coordinates_path
  end
end
