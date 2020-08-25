require 'minitest/autorun'

require_relative 'transaction' 

class TransactionTest < Minitest::Test
  def setup
    @grocery = Transaction.new(20)
  end

  def test_prompt_for_payment
    input = StringIO.new("-20\n10.50\n25\n")
    output = StringIO.new
    @grocery.prompt_for_payment(input: input, output: output)

    assert_equal(25, @grocery.amount_paid)
  end
end