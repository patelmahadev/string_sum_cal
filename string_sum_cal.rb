require 'minitest/autorun'

class StringSumCal
    def self.add(values)
        return 0 if values.empty?
        if values.start_with?("//")
            delimiter, values = values[2..].split("\n", 2)
            values = values.split(/#{Regexp.escape(delimiter)}|\n/)
        else
            values = values.split(/,|\n/)
        end
        negatives = values.select { |n| n.to_i < 0 }
        raise "negative values not allowed: #{negatives.join(", ")}" if negatives.any?
        values.sum(&:to_i)
    end
end
# 
puts StringSumCal.add("") # => 0
puts StringSumCal.add("2") # => 2
puts StringSumCal.add("3,5") # => 8
puts StringSumCal.add("6\n4,8") # => 18
puts StringSumCal.add("5,6,7,8,9")
puts StringSumCal.add("//;\n2;8") # => 10
# puts StringSumCal.add("5,-7") # unlock the line to see error

#  test Cases
class StringSumCalTest < Minitest::Test
    # Test for adding with an empty string value.
    def test_addition_with_empty_string
        assert_equal 0, StringSumCal.add("")
    end
    # Test for adding with a number value.
    def test_addition_with_one_number
        assert_equal 2, StringSumCal.add("2")
    end
    # Test for adding with a Two number values
    def test_addition_with_two_numbers
        assert_equal 15, StringSumCal.add("6,9")
    end
    # Test for adding with new lines between numbers.
    def test_addition_with_new_lines_between_numbers
        assert_equal 14, StringSumCal.add("2\n3,9")
    end
    # Test for adding with multiple numbers
    def test_addition_with_multiple_numbers
        assert_equal 30, StringSumCal.add("4,5,6,7,8")
    end
    # Test for adding with delimiter
    def test_addition_with_delimiters
        assert_equal 14, StringSumCal.add("//;\n6;8")
    end
end