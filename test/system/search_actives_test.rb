require "application_system_test_case"

class SearchActivesTest < ApplicationSystemTestCase
  setup do
    @search_active = search_actives(:one)
  end

  test "visiting the index" do
    visit search_actives_url
    assert_selector "h1", text: "Search Actives"
  end

  test "creating a Search active" do
    visit search_actives_url
    click_on "New Search Active"

    fill_in "Description", with: @search_active.description
    fill_in "Location", with: @search_active.location
    fill_in "Racetype", with: @search_active.raceType
    click_on "Create Search active"

    assert_text "Search active was successfully created"
    click_on "Back"
  end

  test "updating a Search active" do
    visit search_actives_url
    click_on "Edit", match: :first

    fill_in "Description", with: @search_active.description
    fill_in "Location", with: @search_active.location
    fill_in "Racetype", with: @search_active.raceType
    click_on "Update Search active"

    assert_text "Search active was successfully updated"
    click_on "Back"
  end

  test "destroying a Search active" do
    visit search_actives_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Search active was successfully destroyed"
  end
end
