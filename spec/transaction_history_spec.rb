# frozen_string_literal: true

require 'transaction_history'

describe 'transaction history' do
  let(:transactions) { TransactionHistory.new }
  let(:date) { Time.now.strftime('%d/%m/%Y') }

  describe 'record' do
    it 'should initialize with an empty array' do
      expect(transactions.record).to be_empty
    end
  end

  it 'should add details of a deposit to the transaction record' do
    transactions.deposit(30, 30)
    expect(transactions.record).to eq([{ date: date, credit: 30, debit: nil, balance: 30.00 }])
  end

  it 'should add details of a withdrawal to the transaction record' do
    transactions.withdraw(10, -10)
    expect(transactions.record).to eq([{ date: date, credit: nil, debit: 10.00, balance: -10 }])
  end
end
