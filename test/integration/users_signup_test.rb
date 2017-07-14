require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
test "invalid signup information" do
    get registruotis_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
      									 phone: "12345678", 
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end

 test "valid signup information" do
    get registruotis_path
    assert_difference 'User.count', 1 do

      post users_path, params: { user: { name:  "Example User",
      									phone: "623 01702", 
      									email: "user@example.com", 
      									password: "password", 
      									password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
