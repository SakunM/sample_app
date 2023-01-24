require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  def setup
    @title = 'Ruby on Rails Tutorial Sample App'
  end

  test "full title helper" do
    assert_equal @title, full_title
    assert_equal "Help | #{@title}", full_title('Help')
  end
end

__END__
rails test test/helpers/application_helper_test.rb
rails test:helpers