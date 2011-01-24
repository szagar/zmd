require 'test_helper'

class EodPriceTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert EodPrice.new.valid?
  end
end
