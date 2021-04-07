# frozen_string_literal: true

require 'account'

describe 'account' do
  let(:account) { Account.new }

  describe 'balance' do
    it 'should initially be 0' do
      expect(account.balance).to eq 0
    end
    it 'should increase when money is deposited' do
      account.deposit(20)
      expect(account.balance).to eq 20
    end
    it 'should decrease when money is withdrawn' do
      account.deposit(20)
      account.withdraw(5)
      expect(account.balance).to eq 15
    end
  end

  describe 'updating transaction record' do
    before(:each) { account.deposit(20) }
    let(:date) { Time.now.strftime('%d/%m/%Y') }

    it 'each deposit should update the transaction record with the date of the deposit, the amount and the current balance of the account' do
      expect(account.transaction_record.record).to eq([{ date: date, credit: "20.00", debit: '||',
                                                  balance: "20.00" }])
    end

    it 'multiple deposits should be recorded in the transaction record' do
      account.deposit(50)
      expect(account.transaction_record.record).to eq([{ date: date, credit: "20.00", debit: '||',
                                                  balance: "20.00" }, { date: date, credit: "50.00",
                                                                   debit: '||', balance: "70.00" }])
    end

    it 'each withdrawal should update the transaction record with the date of the withdrawal, the amount and the current balance of the account' do
      account.withdraw(10)
      expect(account.transaction_record.record).to eq([{ date: date, credit: "20.00",
                                                  debit: '||', balance: "20.00"}, { date: date, credit: '||', debit: "10.00", balance: "10.00" }])
    end
  end

  describe 'viewing a statement' do
    before(:each) { account.deposit(20) }
    let(:date) { Time.now.strftime('%d/%m/%Y') }

    it 'should show list off all transactions under the colums date, credit, debit, balance' do
      expect {account.print_statement}.to output("date || credit || debit || balance\n#{date} || 20.00 || || || 20.00\n").to_stdout
    end
  end
end
