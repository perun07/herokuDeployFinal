require 'test_helper'

class SearchActivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @search_active = search_actives(:one)
  end

  test "should get index" do
    get search_actives_url
    assert_response :success
  end

  test "should get new" do
    get new_search_active_url
    assert_response :success
  end

  test "should create search_active" do
    assert_difference('SearchActive.count') do
      post search_actives_url, params: { search_active: { description: @search_active.description, location: @search_active.location, raceType: @search_active.raceType } }
    end

    assert_redirected_to search_active_url(SearchActive.last)
  end

  test "should show search_active" do
    get search_active_url(@search_active)
    assert_response :success
  end

  test "should get edit" do
    get edit_search_active_url(@search_active)
    assert_response :success
  end

  test "should update search_active" do
    patch search_active_url(@search_active), params: { search_active: { description: @search_active.description, location: @search_active.location, raceType: @search_active.raceType } }
    assert_redirected_to search_active_url(@search_active)
  end

  test "should destroy search_active" do
    assert_difference('SearchActive.count', -1) do
      delete search_active_url(@search_active)
    end

    assert_redirected_to search_actives_url
  end
end
