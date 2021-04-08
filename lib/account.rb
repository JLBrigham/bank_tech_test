# frozen_string_literal: true

require_relative 'transaction_history'
require_relative 'statement'

class Account
  attr_accessor :balance, :transaction_history, :statement

  def initialize(transaction_history = TransactionHistory.new, statement = Statement.new)
    @balance = 0
    @transaction_history = transaction_history
    @statement = statement
  end

  def deposit(amount)
    update_balance(amount)
    @transaction_history.deposit(amount, balance)
  end

  def withdraw(amount)
    update_balance(amount * -1)
    @transaction_history.withdraw(amount, balance)
  end

  def print_statement
    transactions = @transaction_history.record.reverse
    @statement.format_transactions(transactions)
  end

  private

  def update_balance(amount)
    @balance += amount
  end
end
