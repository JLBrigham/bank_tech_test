# frozen_string_literal: true

class Statement

  def format_transactions(transaction_history)


    transaction_history.map do |transaction|

      if transaction[:credit] == nil 
        transaction[:credit] = "||"
      elsif transaction[:debit] == nil
        transaction[:debit] = "||"
    end
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

