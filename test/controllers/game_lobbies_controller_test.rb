require 'test_helper'

class GameLobbiesControllerTest < ActionController::TestCase
  test "should get GameOne" do
    get :GameOne
    assert_response :success
  end

  test "should get GameTwo" do
    get :GameTwo
    assert_response :success
  end

  test "should get GameThree" do
    get :GameThree
    assert_response :success
  end

  test "should get GameFour" do
    get :GameFour
    assert_response :success
  end

end
