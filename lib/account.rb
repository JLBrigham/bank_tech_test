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
    @transaction_record[:date] << date_of_transaction
    @transaction_record[:credit] << amount
    @transaction_record[:debit] << "||"
    @transaction_record[:balance] = @balance 
  end

  def withdraw(amount)
    @balance -= amount
    @transaction_record[:date] << date_of_transaction
    @transaction_record[:credit] << "||"
    @transaction_record[:debit] << amount
    @transaction_record[:balance] = @balance 

  end

  private

  def date_of_transaction
    time = Time.new.strftime("%d/%m/%Y")
  end
end
