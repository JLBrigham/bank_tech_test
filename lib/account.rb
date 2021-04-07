# frozen_string_literal: true

require_relative 'transaction_record'

class Account
  attr_accessor :balance, :transaction_record

  def initialize(transaction_record = TransactionRecord.new)
    @balance = 0.00
    @transaction_record = transaction_record.record
  end

  def deposit(amount)
    @balance += amount
    deposit_update_transaction_record(amount)
  end

  def withdraw(amount)
    @balance -= amount
    withdraw_update_transaction_record(amount)
  end

  def statement
    counter = 0
    print "date || credit || debit || balance\n"
     @transaction_record.map do |transaction| 
          transaction.each do |key, value|  
            counter += 1
            if counter % 5 == 0
              puts "\n"
            end
            print value.to_s + " || "

          

      end
      
     end
    
     
      

  end


  private

  def date_of_transaction
    Time.new.strftime('%d/%m/%Y')
  end

  def deposit_update_transaction_record(amount)
    @transaction_record << { date: date_of_transaction, credit: amount, debit: '||', balance: @balance }
  end

  def withdraw_update_transaction_record(amount)
    @transaction_record << { date: date_of_transaction, credit: '||', debit: amount, balance: @balance }
  end
end
