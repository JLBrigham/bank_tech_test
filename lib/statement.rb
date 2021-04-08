# frozen_string_literal: true

class Statement
  def format_transactions(transaction_history)
    transaction_history.map do |transaction|
      transaction[:credit] = case transaction[:credit]
                             when nil
                               '||'
                             else
                               format('%.2f', transaction[:credit])
                             end

      transaction[:debit] = case transaction[:debit]
                            when nil
                              '||'
                            else
                              format('%.2f', transaction[:debit])
                            end

      transaction[:balance] = format('%.2f', transaction[:balance])
    end

    print_transactions(transaction_history)
  end

  private

  def print_transactions(transaction_history)
    print "date || credit || debit || balance\n"

    transaction_history.each do |transaction|
      print "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}\n"
    end
  end
end
