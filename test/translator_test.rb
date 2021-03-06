require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator'

class TranslatorTest < Minitest::Test

  def setup
    @message = File.open(ARGV[0], "r")
    @braille = File.open(ARGV[1], "w")
    @read_message = @message.read.chomp
    @write_braille = @braille.write(@read_message)
    @translator = Translator.new(@read_message, @write_braille)
  end

  def test_it_exists
    assert_instance_of Translator, @translator
  end

  def test_it_has_attributes
    assert_instance_of Hash, @translator.braille_hash
    assert_equal "abcd", @translator.message
    assert_equal 4, @translator.braille
  end

  # def test_it_can_write_to_new_file
  #   require "pry"; binding.pry
  #   copy = Translator.write_to_braille
  #   assert_equal "a", copy
  # end

  # def test_it_can_translate_a_letter
  #   assert_equal "0.\n..\n..", @translator.translate(@message_file)
  # end
end
