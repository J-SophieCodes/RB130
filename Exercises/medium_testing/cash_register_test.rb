require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction' # class depends on collaboration with the Transaction class.

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(100)
    @grocery = Transaction.new(20)
  end

  def test_accept_money
    initial_total = @register.total_money

    @grocery.amount_paid = 20
    @register.accept_money(@grocery)

    assert_equal(initial_total + 20, @register.total_money)
  end

  def test_change
    @grocery.amount_paid = 50

    assert_equal(30, @register.change(@grocery))
  end

  def test_give_receipt
    expected = <<~EXPECTED
    You've paid $20.
    EXPECTED

    assert_output(expected) { @register.give_receipt(@grocery) }
  end
end