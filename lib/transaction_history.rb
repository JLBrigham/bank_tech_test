# frozen_string_literal: true

class TransactionHistory
  attr_accessor :record

  DATE = Time.new.strftime('%d/%m/%Y')

  def initialize(record = [])
    @record = record
  end

  def deposit(amount, balance, date = DATE)
    @record << { date: date, credit: amount, debit: nil, balance: balance }
  end

  def withdraw(amount, balance, date = DATE)
    @record << { date: date, credit: nil, debit: amount, balance: balance }
  end
end
