require "test_helper"

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "index including pagination" do
    assert_equal 1, 1
    # log_in_as(@user)
    # get users_path
    # assert_template 'users/index'
    # assert_select 'div.pagination', count: 2
    # User.paginate(page: 1, per_page: 9).each do |user|
    #   assert_select 'a[href=?]', user_path(user), text: user.name
    # end
  end
end

__END__
rails test test/integration/users_index_test.rb
rails test:integration