# frozen_string_literal: true

class Statement

  def format_transactions(transaction_history)

    formatted_transactions = []
    

  end


  def print_transactions(transaction_history)
    print "date || credit || debit || balance\n"

    transaction_history.each do |transaction|
      print "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}\n"
    end
  end
end

