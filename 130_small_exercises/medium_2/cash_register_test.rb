require "minitest/autorun"
# require all the libraries, give us access to certain parts of the minitest framework that we need.
require_relative 'cash_register' # require all the files
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(45)
    @transaction = Transaction.new(10)
    @transaction.amount_paid = 15
  end

  def test_accept_money
    previous_amt = @register.total_money
    @register.accept_money(@transaction)
    current_amt = @register.total_money

    assert_equal(previous_amt + 15, current_amt)
  end

  def test_change
    item_cost = @transaction.item_cost
    amount_paid = @transaction.amount_paid
    # @transaction.getter_method is called in case we change values during setup
    change = @register.change(@transaction)

    assert_equal(amount_paid - item_cost, change)
  end

  def test_give_receipt
    item_cost   = 199
    register    = CashRegister.new(1000)
    transaction = Transaction.new(item_cost)

    assert_output("You've paid $#{item_cost}.\n") do
      register.give_receipt(transaction)
    end
  end

  def test_prompt_for_payment
    item_cost   = 199
    transaction = Transaction.new(item_cost)
    input = StringIO.new('199\n') # we pass in a StringIO object to be assigned to $stdin.
    output = StringIO.new # mock object to store messages passed in to puts

    transaction.prompt_for_payment(input: input, output: output)
    assert_equal(199, transaction.amount_paid)

    input  = StringIO.new("198\n199")
    transaction.prompt_for_payment(input: input, output: output)

    assert_match(/That is not the correct amount/, output.string)
    assert_match(/Please make sure to pay the full cost./, output.string)
  end

  def
end