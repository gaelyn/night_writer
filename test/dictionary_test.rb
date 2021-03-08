require 'minitest/autorun'
require 'minitest/pride'
require './lib/dictionary'

class DictionaryTest < Minitest::Test

  def setup
    @dictionary = Dictionary.new
  end

  def test_it_exists
    assert_instance_of Dictionary, @dictionary
  end

  def test_it_has_attributes
    assert_equal Hash, @dictionary.braille_hash.class
    assert_equal Hash, @dictionary.english_hash.class
    assert_equal ["0.", "..", ".."], @dictionary.braille_hash["a"]
    assert_equal "a", @dictionary.english_hash[["0.", "..", ".."]]
  end

  def test_it_can_be_broken_into_3_lines
     assert_equal "0.", @dictionary.line1["a"]
  end

  def test_it_can_be_broken_into_3_lines
     assert_equal "..", @dictionary.line2["a"]
  end

  def test_it_can_be_broken_into_3_lines
     assert_equal "..", @dictionary.line3["a"]
  end

  # def test_it_can_read_braille_text
  #   require "pry"; binding.pry
  #   assert_equal ["0.0.", "..0.", "...."], @dictionary.braille_lines
  # end
end
