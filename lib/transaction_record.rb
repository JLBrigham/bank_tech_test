# frozen_string_literal: true

class TransactionRecord
  attr_accessor :record

  def initialize(record = [])
    @record = record
  end

  def deposit(amount, date, balance)
    @record << { date: date, credit: format('%.2f', amount), debit: '||', balance: format('%.2f', balance) }
  end

  def withdraw(amount, date, balance)
    @record << { date: date, credit: '||', debit: format('%.2f', amount), balance: format('%.2f', balance) }
  end
end
