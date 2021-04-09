class Transaction
    def initialize(credit, debit, balance)
        @date = Time.new
        @credit = credit
        @debit = debit
        @balance = balance
    end

    def print_transaction
        print "#{@date.strftime('%d/%m/%Y')} || #{format_currency(@credit)} || #{format_currency(@debit)} || #{format_currency(@balance)}\n"
    end

    private

    def format_currency(amount)
    if amount == nil
        '||'
    else
       format('%.2f', amount)
    end

    end


end