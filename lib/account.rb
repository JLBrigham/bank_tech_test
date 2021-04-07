# frozen_string_literal: true

require_relative 'transaction_record'
require_relative 'statement'

class Account
  attr_accessor :balance, :transaction_record, :statement

  def initialize(transaction_record = TransactionRecord.new, statement = Statement.new)
    @balance = 0.00
    @transaction_record = transaction_record
    @statement = statement
  end

  def deposit(amount, date = Time.new.strftime('%d/%m/%Y'))
    @balance += amount
    @transaction_record.deposit(amount, date, balance)
  end

  def withdraw(amount, date = Time.new.strftime('%d/%m/%Y'))
    @balance -= amount
    @transaction_record.withdraw(amount, date, balance)
  end

  def print_statement
    transactions = @transaction_record.record

    @statement.print_transactions(transactions)
  end


end
