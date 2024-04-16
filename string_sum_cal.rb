require 'minitest/autorun'

class StringSumCal
  def self.add(values)
    return 0 if values.empty?
  end
end
# 
puts StringSumCal.add("") # => 0

class StringSumCalTest < Minitest::Test
  # Test for adding with an empty string.
  def test_addition_with_empty_string
    assert_equal 0, StringSumCal.add("")
  end
end