require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
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
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path(@user), user: { username: @user.username,
                                    email: @user.email }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
end