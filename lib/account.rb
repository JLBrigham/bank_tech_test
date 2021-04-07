# frozen_string_literal: true

require_relative 'transaction_record'
require_relative 'statement'

class Account
  attr_accessor :balance, :transaction_record, :statement

  def initialize(transaction_record = TransactionRecord.new, statement = Statement.new)
    @balance = 0.00
    @transaction_record = transaction_record.record
    @statement = statement
  end

  def deposit(amount, date = Time.new.strftime('%d/%m/%Y'))
    @balance += amount
    deposit_update_transaction_record(amount, date)
  end

  def withdraw(amount, date = Time.new.strftime('%d/%m/%Y'))
    @balance -= amount
    withdraw_update_transaction_record(amount, date)
  end

  def print_statement
    transactions = @transaction_record

    @statement.print_transactions(transactions)
  end

  private

  def deposit_update_transaction_record(amount, date)
    @transaction_record << { date: date, credit: "%.2f" % [amount], debit: '||', balance: "%.2f" %  [@balance] }
  end

  def withdraw_update_transaction_record(amount, date)
    @transaction_record << { date: date, credit: '||', debit: "%.2f" % [amount], balance: "%.2f" %  [@balance]  }
  end
end
