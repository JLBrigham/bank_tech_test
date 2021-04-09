require 'transaction'

describe 'transaction' do
    let(:date) { Time.now }

    it 'should format a transaction so integers appear with trailing zeros and date is formatted dd/mm/yyyy' do
        transaction = Transaction.new(20, nil, 20)
        expect do transaction.print_transaction
        end.to output("#{date.strftime('%d/%m/%Y')} || 20.00 || || || 20.00\n").to_stdout
    end


end


