# frozen_string_literal: true

class TransactionHistory
  attr_accessor :record

  def initialize(record = [])
    @record = record
  end

  def deposit(amount, balance, date = Time.new.strftime('%d/%m/%Y'))
    @record << { date: date, credit: format('%.2f', amount), debit: '||', balance: format('%.2f', balance)  }
  end

  def withdraw(amount, balance, date = Time.new.strftime('%d/%m/%Y'))
    @record << { date: date, credit: '||', debit: format('%.2f', amount), balance: format('%.2f', balance) }
  end
end
