class Tax

  attr_reader :tax_rate
    
  TAX_EXEMPT_RATE = 0
  DEFAULT_TAX_RATE = 10
  IMPORT_TAX_RATE = 5
  ROUNDING_TO = 0.05

  def self.BOOK	               #static class
   Tax.new(TAX_EXEMPT_RATE)  # do you have to do "level" of decoration before doing another "level"?
  end

  def self.MEDICINE
   Tax.new(TAX_EXEMPT_RATE)
  end

  def self.FOOD
   Tax.new(TAX_EXEMPT_RATE)
  end

  def self.OTHER
   Tax.new(DEFAULT_TAX_RATE)
  end

  def self.IMPORTED(classification)
   Tax.new(classification.tax_rate + IMPORT_TAX_RATE)
  end

  def calculate_tax(price)
   return ("%.2f" %(((((price * @tax_rate).to_f/100)/ROUNDING_TO).ceil) * ROUNDING_TO)).to_f
  end

  private		#so that no one else can create any new taxations
  def initialize(tax_rate)
    @tax_rate = tax_rate
  end

end

