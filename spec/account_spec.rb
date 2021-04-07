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
    let (:date) { Time.now.strftime("%d/%m/%Y") }

    it 'each deposit should update the transaction record with the date of the deposit, the amount and the current balance of the account' do
      expect(account.transaction_record).to eq({ date: [date], credit: [20], debit: ['||'],
                                                 balance: 20 })
    end

    it 'multiple deposits should be recorded in the transaction record, but the current balance is always displayed' do
      account.deposit(50)
      expect(account.transaction_record).to eq({ date: [date, date], credit: [20, 50],
                                                 debit: ['||', '||'], balance: 70 })
    end

    it 'each withdrawal should update the transaction record with the date of the withdrawal, the amount and the current balance of the account' do
      account.withdraw(10)
      expect(account.transaction_record).to eq({ date: [date, date], credit: [20, '||'],
                                                 debit: ['||', 10], balance: 10 })
    end
  end
end
