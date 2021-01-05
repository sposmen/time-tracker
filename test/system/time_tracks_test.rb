require "application_system_test_case"

class TimeTracksTest < ApplicationSystemTestCase
  setup do
    @time_track = time_tracks(:one)
  end

  test "visiting the index" do
    visit time_tracks_url
    assert_selector "h1", text: "Time Tracks"
  end

  test "creating a Time track" do
    visit time_tracks_url
    click_on "New Time Track"

    fill_in "Description", with: @time_track.description
    fill_in "End at", with: @time_track.end_at
    fill_in "Start at", with: @time_track.start_at
    click_on "Create Time track"

    assert_text "Time track was successfully created"
    click_on "Back"
  end

  test "updating a Time track" do
    visit time_tracks_url
    click_on "Edit", match: :first

    fill_in "Description", with: @time_track.description
    fill_in "End at", with: @time_track.end_at
    fill_in "Start at", with: @time_track.start_at
    click_on "Update Time track"

    assert_text "Time track was successfully updated"
    click_on "Back"
  end

  test "destroying a Time track" do
    visit time_tracks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Time track was successfully destroyed"
  end
end
