require 'minitest/autorun'

require_relative 'text_class' 

class TextTest < Minitest::Test
  def setup
    @file = File.open("sample_text.txt")
    @read_text = @file.read
    @text = Text.new(@read_text)
  end

  def test_swap
    a = @read_text.count("a")
    e = @read_text.count("e")

    assert_equal(a + e, @text.swap("a", "e").count("e"))
    assert_equal(0, @text.swap("a", "e").count("a"))
  end

  def test_word_count
    assert_equal(72, @text.word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end
