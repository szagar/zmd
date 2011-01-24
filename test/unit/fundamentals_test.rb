require 'test_helper'

class FundamentalsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Fundamentals.new.valid?
  end
end
