# frozen_string_literal: true

require_relative 'transaction_record'
require 'Date'

class Account
  attr_accessor :balance, :transaction_record

  def initialize
    @balance = 0
    @transaction_record = Transaction_record.new.record
  end

  def deposit(amount)
    @balance += amount
    time = Time.new
    @transaction_record[:date] = time.strftime("%d/%m/%Y")
    @transaction_record[:credit] = amount
    @transaction_record[:debit] = "||"
    @transaction_record[:balance] = @balance 
  end

  def withdraw(amount)
    @balance -= amount
  end
end
