require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example User', email: 'user@example.com',
      password: 'foobar', password_confirmation: 'foobar')
  end

  test "should be valid?" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = '    '
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ''
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = 'a' * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid address" do
    valid_addresses = %w[user@example.com User@foo.COM
      A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |addres|
      @user.email = addres
      assert @user.valid?, "#{addres.inspect} should be valid"
    end    
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org
      user.name@example. foo@bar_bax.com foo@bar+baz.com
      foo@bar..com]
    invalid_addresses.each do |addres|
      @user.email = addres
      assert_not @user.valid?, "#{addres.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "eamil addresses should be saved as lowercase" do
    mixed_case_email = 'Foo@ExaMPle.CoM'
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = ' ' * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end
end

__END__
rails test test/models/user_test.rb
rails test:models

test/models/user_test.rb      u_t
test/test_helper.rb           th
test/integration/users_login_test.rb    ult
test/integration/users_edit_test.rb     uet
