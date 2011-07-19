class Tax

  attr_reader :original_tax, :tax_rate # this should go away?
    
  TAX_EXEMPT_RATE = 0
  BASIC_TAX_RATE = 10
  IMPORT_TAX_RATE = 5
  ROUNDING_TO = 0.05

  def self.EXEMPT(original_tax)
   Tax.new(original_tax, TAX_EXEMPT_RATE)
  end

  def self.BASIC(original_tax)
    Tax.new(original_tax, BASIC_TAX_RATE)   
  end

  def self.IMPORTED(original_tax)
   Tax.new(original_tax, IMPORT_TAX_RATE)
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
