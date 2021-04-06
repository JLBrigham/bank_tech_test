require 'transaction_record'

describe 'transaction record' do
    let (:transactions) {Transaction_record.new}
    describe 'record' do
        it 'should have 4 keys; date, credit, debit and balance' do
            expect(transactions.record.keys).to eq [:date, :credit, :debit, :balance]
        end
        it 'all keys should have the value of nil' do
            expect(transactions.record.values).to eq [nil, nil, nil, nil]
        end
    end

end