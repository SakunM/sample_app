require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', root_path, count: 2
    assert_select 'a[href=?]', help_path
    assert_select 'a[href=?]', about_path
    assert_select 'a[href=?]', contact_path
    get contact_path
    assert_select 'title', full_title('Contact')
    get signup_path
    assert_select 'title', full_title('Sign up')
  end

  test "what samething see aftar login" do
    log_in_as(@user)
    assert_equal 1, 1
  end
end

__END__
rails test test/integration/site_layout_test.rb
rails test:integration

test/models/user_test.rb      u_t
test/test_helper.rb           th
test/integration/users_login_test.rb    ult
test/integration/users_edit_test.rb     uet
test/integration/site_layout_test.rb    slt
test/controllers/users_controller_test.rb	usct
test/fixtures/users.yml tfu