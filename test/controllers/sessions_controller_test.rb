require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_path
    assert_response :success
  end
end

__END__
rails test test/controllers/sessions_controller_test.rb
rails test:controllers

test/controllers/sessions_controller_test.rb  ns_c_t
test/integration/users_login_test.rb          rs_l_t
