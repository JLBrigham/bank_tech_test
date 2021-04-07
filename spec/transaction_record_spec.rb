# frozen_string_literal: true

require 'transaction_record'

describe 'transaction record' do
  let(:transactions) { TransactionRecord.new }
  describe 'record' do
    it 'should initialize with an empty array' do
      expect(transactions.record).to be_empty
    end
  end
end
