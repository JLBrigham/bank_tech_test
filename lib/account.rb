# frozen_string_literal: true

require_relative 'transaction_history'
require_relative 'statement'

class Account
  attr_accessor :balance, :transaction_history, :statement

  def initialize(transaction_history = TransactionHistory.new, statement = Statement.new)
    @balance = 0.00
    @transaction_history = transaction_history
    @statement = statement
  end

  def deposit(amount, date = Time.new.strftime('%d/%m/%Y'))
    credit(amount)
    @transaction_history.deposit(amount, date, balance)
  end

  def withdraw(amount, date = Time.new.strftime('%d/%m/%Y'))
    debit(amount)
    @transaction_history.withdraw(amount, date, balance)
  end

  def print_statement
    transactions = @transaction_history.record.reverse
    @statement.print_transactions(transactions)
  end

  private

  def credit(amount)
    @balance += amount
  end

  def debit(amount)
    @balance -= amount
  end


end
