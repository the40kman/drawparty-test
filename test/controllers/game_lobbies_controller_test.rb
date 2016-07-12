require 'test_helper'

class GameLobbiesControllerTest < ActionController::TestCase
   def setup
    @user = users(:michael)
    @other_user = users(:archer)
    @guest_user = users(:guestie)
  end
  test "should get GameOne" do
    log_in_as(@user)
    get :GameOne
    assert_response :success
  end

  test "should get GameTwo" do
    log_in_as(@user)
    get :GameTwo
    assert_response :success
  end

  test "should get GameThree" do
    log_in_as(@user)
    get :GameThree
    assert_response :success
  end

  test "should get GameFour" do
    log_in_as(@user)
    get :GameFour
    assert_response :success
  end

end
