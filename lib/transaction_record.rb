# frozen_string_literal: true

class Transaction_record
  attr_accessor :record

  def initialize
    @record = { date: nil, credit: nil, debit: nil, balance: nil }
  end
end
