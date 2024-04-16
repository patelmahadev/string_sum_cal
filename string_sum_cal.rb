require 'minitest/autorun'

class StringSumCal
    def self.add(values)
        return 0 if values.empty?
        return values.to_i if values.length == 1
    end
end

puts StringSumCal.add("") # => 0
puts StringSumCal.add("2") # => 3
class StringSumCalTest < Minitest::Test
    # Test for adding with an empty string value.
    def test_addition_with_empty_string
        assert_equal 0, StringSumCal.add("")
    end
    # Test for adding with a number value
    def test_addition_with_one_number
        assert_equal 2, StringSumCal.add("2")
    end
end