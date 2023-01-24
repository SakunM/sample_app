require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_path
    assert_response :success
  end
end

__END__
rails test test/controllers/users_controller_test.rb
rails test:controllers