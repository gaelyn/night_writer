require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator'

class TranslatorTest < Minitest::Test

  def setup
    @message = File.open(ARGV[0], "r")
    @read_message = @message.read.chomp
    @braille = File.open(ARGV[1], "w")
    @translator = Translator.new(@read_message, @braille)
  end

  def test_it_exists
    skip
    assert_instance_of Translator, @translator
  end

  def test_it_has_attributes
    skip
    #Use mocks and stubs here
    assert_instance_of Hash, @translator.braille_hash
    assert_equal "a", @translator.message
    assert_instance_of File, @translator.braille
    assert_equal 1, @translator.write_braille(@read_message)
  end

  def test_it_can_turn_message_into_array
    skip
    assert_equal ["a"], @translator.message_to_array
  end

  def test_it_can_translate_a_letter
    skip
    assert_equal "0.\n..\n..", @translator.translate
    assert_equal 8, @translator.write_braille(@translator.translate)
  end

  def test_it_can_translate_two_letters
    assert_equal "0.0.\n..0.\n....", @translator.translate
  end
end
