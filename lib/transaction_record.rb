# frozen_string_literal: true

class Transaction_record
  attr_accessor :record

  def initialize
    @record = { date: [], credit: [], debit: [], balance:nil }
  end
end
