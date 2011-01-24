require 'test_helper'

class TechnicalsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Technicals.new.valid?
  end
end
