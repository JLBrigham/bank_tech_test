# frozen_string_literal: true

require_relative 'transaction_record'

class Account
  attr_accessor :balance, :transaction_record

  def initialize
    @balance = 0
    @transaction_record = Transaction_record.new.record
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end
