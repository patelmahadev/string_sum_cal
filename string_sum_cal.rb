require 'minitest/autorun'

class StringSumCal
  def self.add(values)
    return 0 if values.empty?
    values = values.split(/,|\n/)
    values.map(&:to_i).sum
  end
end
# 
puts StringSumCal.add("") # => 0
puts StringSumCal.add("2") # => 2
puts StringSumCal.add("3,5") # => 8

#  test Cases
class StringSumCalTest < Minitest::Test
  # Test for adding with an empty string value.
  def test_addition_with_empty_string
    assert_equal 0, StringSumCal.add("")
  end
  # Test for adding with a number value
  def test_addition_with_one_number
    assert_equal 2, StringSumCal.add("2")
  end
  # Test for adding with a Two number values
  def test_addition_with_two_numbers
    assert_equal 8, StringSumCal.add("6,2")
  end

end