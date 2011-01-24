require 'test_helper'

class AssetTypeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert AssetType.new.valid?
  end
end
