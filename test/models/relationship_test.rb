require "test_helper"

class RelationshipTest < ActiveSupport::TestCase
  def setup
    @rs = Relationship.new(follower_id: users(:michael).id,
      followed_id: users(:archer).id)
  end

  test "should be valid" do
    assert @rs.valid?
  end

  test "should require a follower_id" do
    @rs.follower_id = nil
    assert_not @rs.valid?
  end

  test "should require a followed_id" do
    @rs.followed_id = nil
    assert_not @rs.valid?
  end
end

__END__
rails test test/models/relationship_test.rb
rails test:models
