require 'account'

describe 'account' do
    it 'should initially have a balance of 0' do
        account = Account.new
        expect(account.balance).to eq 0
    end
end
        