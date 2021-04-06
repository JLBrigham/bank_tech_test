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

  #add a before each to deposit 20

  describe 'deposit' do
    it 'should update the transaction record with the date of the deposit, the amount and the current balance of the account' do
      account.deposit(20)
      #need to stub date rather than using today's date
      expect(account.transaction_record).to eq({ date: ['06/04/2021'], credit: [20], debit: ['||'],
                                                 balance: 20 })
    end

    it 'multiple deposits should be recorded in the transaction record, but the current balance is always displayed' do
        account.deposit(20)
        account.deposit(50)
        expect(account.transaction_record).to eq({date: ['06/04/2021', '06/04/2021'], credit: [20, 50,], debit: ['||', '||'], balance: 70})
  end
end

describe 'withdraw' do
    it 'should update the transaction record with the date of the withdrawal, the amount and the current balance of the account' do
        account.deposit(20)
        account.withdraw(10)
        expect(account.transaction_record).to eq({date: ['06/04/2021', '06/04/2021'], credit: [20, '||'], debit: ['||', 10], balance: 10})
    end
end
end
