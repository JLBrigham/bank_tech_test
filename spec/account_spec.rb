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

  describe 'deposit' do
    it 'should update the transaction record with the date of the deposit, the amount and the current balance of the account' do
      account.deposit(20)
      expect(account.transaction_record).to eq({ date: '06/04/2021', credit: 20, debit: '||',
                                                 balance: 20 })
    end
  end
end
