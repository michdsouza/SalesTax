class Tax

  attr_reader :original_tax, :tax_rate # this should go away?
  
  ROUNDING_TO = 0.05

  def self.Applicable_Taxes(tax_rates)
      original_tax = NullTax.new
      tax_rates.each do |tax_rate|
      	original_tax = Tax.new(original_tax, tax_rate)
      end
      return original_tax
  end

  def self.EMPTY 	#new class with an explicit calculate_tax method that returns just a 0
   NullTax.new
  end

  def calculate_tax(price)
   new_tax = ("%.2f" %((((@tax_rate.to_f/100 * price)/ROUNDING_TO).ceil) * ROUNDING_TO)).to_f
   return original_tax.calculate_tax(price) + new_tax
  end

  private		#so that no one else can create any new taxations
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
