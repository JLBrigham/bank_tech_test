# frozen_string_literal: true

require 'account'

describe 'account' do
  describe 'balance' do
    it 'should initially be 0' do
      account = Account.new
      expect(account.balance).to eq 0
    end
    it 'should increase when money is deposited' do
      account = Account.new
      account.deposit(20)
      expect(account.balance).to eq 20
    end
  end
end
