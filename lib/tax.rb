class Tax
  
  ROUNDING_TO = 0.05

  def self.EMPTY
   NullTax.new
  end

  def calculate_tax(price)
   new_tax = ("%.2f" %((((@tax_rate.to_f/100 * price)/ROUNDING_TO).ceil) * ROUNDING_TO)).to_f
   return @original_tax.calculate_tax(price) + new_tax
  end

  def initialize(original_tax, tax_rate)
    @original_tax = original_tax
    @tax_rate = tax_rate
  end

end

class NullTax # < Tax
  def calculate_tax(price)
   return 0
  end
end
