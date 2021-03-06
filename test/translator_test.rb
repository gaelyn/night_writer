require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator'

class TranslatorTest < Minitest::Test

  def setup
    @message = File.open(ARGV[0], "r")
    @read_message = @message.read.chomp
    @braille = File.open(ARGV[1], "w")
    # @write_braille = @braille.write(@read_message)
    # @translator = Translator.new(@read_message, @write_braille)
    @translator = Translator.new(@read_message, @braille)
  end

  def test_it_exists
    assert_instance_of Translator, @translator
  end

  def test_it_has_attributes
    #Use mocks and stubs here
    assert_instance_of Hash, @translator.braille_hash
    assert_equal "a", @translator.message
    # assert_equal 4, @translator.braille
    assert_instance_of File, @translator.braille
    assert_equal 1, @translator.write_braille(@read_message)
  end

  def test_it_can_translate_a_letter
    # require "pry"; binding.pry
    assert_equal "0.\n..\n..", @translator.translate
  end
end
