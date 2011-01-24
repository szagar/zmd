require 'test_helper'

class SplitTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Split.new.valid?
  end
end
