require "test_helper"

class TimeTracksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_track = time_tracks(:one)
  end

  test "should get index" do
    get time_tracks_url
    assert_response :success
  end

  test "should get new" do
    get new_time_track_url
    assert_response :success
  end

  test "should create time_track" do
    assert_difference('TimeTrack.count') do
      post time_tracks_url, params: { time_track: { description: @time_track.description, end_at: @time_track.end_at, start_at: @time_track.start_at } }
    end

    assert_redirected_to time_track_url(TimeTrack.last)
  end

  test "should show time_track" do
    get time_track_url(@time_track)
    assert_response :success
  end

  test "should get edit" do
    get edit_time_track_url(@time_track)
    assert_response :success
  end

  test "should update time_track" do
    patch time_track_url(@time_track), params: { time_track: { description: @time_track.description, end_at: @time_track.end_at, start_at: @time_track.start_at } }
    assert_redirected_to time_track_url(@time_track)
  end

  test "should destroy time_track" do
    assert_difference('TimeTrack.count', -1) do
      delete time_track_url(@time_track)
    end

    assert_redirected_to time_tracks_url
  end
end
