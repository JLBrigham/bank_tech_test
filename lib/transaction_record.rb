# frozen_string_literal: true

class TransactionRecord
  attr_accessor :record

  def initialize
    @record = { date: [], credit: [], debit: [], balance: nil }
  end
end
