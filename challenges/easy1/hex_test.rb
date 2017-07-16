require 'minitest/autorun'
require_relative 'hex'

class HexTest < Minitest::Test
  def test_hex_1_is_decimal_1
    assert_equal(1, Hex.new('1').to_decimal)
  end

  def test_hex_2_is_decimal_2
    assert_equal(2, Hex.new('2').to_decimal)
  end

  def test_hex_10_is_decimal_16
    assert_equal(16, Hex.new('10').to_decimal)
  end

  def test_hex_2F_is_decimal_47
    assert_equal(47, Hex.new('2F').to_decimal)
  end

  def test_hex_3FA_is_decimal_1018
    assert_equal(1018, Hex.new('3FA').to_decimal)
  end

  def test_hex_eeeee_is_decimal_978670
    assert_equal(978670, Hex.new('EEEEE').to_decimal)
  end

  def test_hex_eeeee_downcase_is_decimal_978670
    assert_equal(978670, Hex.new('eeEee').to_decimal)
  end

  def test_hex_abcdefg_is_invalid
    assert_equal(0, Hex.new('ABCDEFG').to_decimal)
  end
end