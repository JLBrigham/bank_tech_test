# frozen_string_literal: true

require 'transaction_record'

describe 'transaction record' do
  let(:transactions) { TransactionRecord.new }
  let(:date) { Time.now.strftime('%d/%m/%Y') }

  describe 'record' do
    it 'should initialize with an empty array' do
      expect(transactions.record).to be_empty
    end
  end

  it 'should add details of a deposit to the transaction record' do
    transactions.deposit(30, date, 30)
    expect(transactions.record).to eq([{ date: date, credit: '30.00', debit: '||', balance: '30.00' }])
  end

  it 'should add details of a withdrawal to the transaction record' do
    transactions.withdraw(10, date, -10)
    expect(transactions.record).to eq([{ date: date, credit: '||', debit: '10.00', balance: '-10.00' }])
  end
end
