require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
  end

  test "invalid signup information" do
    get signup_path
    assert_no_different "User.count" do 
      post users_path, params: { user: { name: "",
      	email: "user@invalid",
      	password: "foo",
      	password_confirmation: "bar" }} 	
    end
    assert_template "user/new"
    assert_select "div#<CSS id for error explanation>"
    assert_select "div.<CSS class for field with error>"
  end

  test "valid signup information with account activation" do
  	get signup_path
  	assert_difference "User.count", 1 do
  	  post users_path, params: { user: { name: "Example User",
  	  	                         email: "user@example.com",
  	  	                         password: "password",
  	  	                         password_confirmation: "password" } }
  	end
  	follow_redirect!
  	assert_template "users/show"
  	# flash.FILL_IN
  	assert is_logged_in?
  end
end
