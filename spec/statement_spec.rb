# frozen_string_literal: true

require 'statement'

describe 'statement' do
  let(:statement) { Statement.new }

  it 'should print a record of each transaction' do
    transactions = [{ date: 'date', credit: 20, debit: nil,
                      balance: 20 }]
    expect do
      statement.format_transactions(transactions)
    end.to output("date || credit || debit || balance\ndate || 20 || || || 20\n").to_stdout
  end
end
