require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator'
# require './message'
# require './braille'

class TranslatorTest < Minitest::Test

  def setup
    @message, @braille = ARGV

    # @message = message.txt
    # @braille = braille.txt
    @message_file = File.open("./#{@message}").read.chomp
    @braille_file = File.open("./#{@braille}", "w")
    # @braille_text = @braille_file.write @message_file
    @translator = Translator.new(@message_file, @braille_file)
  end

  def test_it_exists
    assert_instance_of Translator, @translator
  end

  def test_it_has_attributes
    assert_instance_of Hash, @translator.braille_hash
    assert_equal "a", @translator.message
    # assert_equal "a", @translator.braille
  end

  # def test_it_can_translate_a_letter
  #   assert_equal "0.\n..\n..", @translator.translate(@message_file)
  # end
end
