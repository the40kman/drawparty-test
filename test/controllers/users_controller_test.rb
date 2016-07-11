require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
    @guest_user = users(:guest)
  end
  
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "DrawParty"
  end

  test "should get new" do
    get signup_path
    assert_response :success
    assert_select "title", "Sign up | DrawParty"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | DrawParty"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | DrawParty"
  end

  test "should redirect edit when not logged in" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when not logged in" do
    log_in_as(@other_user)
    patch user_path(@user), user: { username: @user.username,
                                    email: @user.email }
    assert flash.empty?
    assert_redirected_to root_url
  end
  
  # test "should redirect edit when guest" do
  #   log_in_as(@guest_user)
  #   get edit_user_path(@guest_user)
  #   assert flash.empty?
  #   assert_redirected_to root_url
  # end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end
end