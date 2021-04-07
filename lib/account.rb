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

  def deposit(amount)
    @balance += amount
    deposit_update_transaction_record(amount)
  end

  def withdraw(amount)
    @balance -= amount
    withdraw_update_transaction_record(amount)
  end

  def print_statement
    transactions = @transaction_record

    @statement.print_transactions(transactions)
  end

  private

  def date_of_transaction
    Time.new.strftime('%d/%m/%Y')
  end

  def deposit_update_transaction_record(amount)
    @transaction_record << { date: date_of_transaction, credit: "%.2f" % [amount], debit: '||', balance: "%.2f" %  [@balance] }
  end

  def withdraw_update_transaction_record(amount)
    @transaction_record << { date: date_of_transaction, credit: '||', debit: "%.2f" % [amount], balance: "%.2f" %  [@balance]  }
  end
end
