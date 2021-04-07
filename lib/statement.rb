# frozen_string_literal: true

class Statement
  def print_transactions(transaction_record)
    print "date || credit || debit || balance\n"

    @statement = transaction_record.reverse.each do |transaction|
      print "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}\n"
    end
  end
end
