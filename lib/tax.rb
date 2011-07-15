class Tax

  attr_reader :tax_rate # this should go away?
    
  TAX_EXEMPT_RATE = 0
  BASIC_TAX_RATE = 10
  IMPORT_TAX_RATE = 5
  ROUNDING_TO = 0.05

  def self.BOOK(original_tax)
   #Tax.new(original_tax, TAX_EXEMPT_RATE)
   Tax.new(original_tax.tax_rate + TAX_EXEMPT_RATE)
  end

  def self.MEDICINE(original_tax)
   Tax.new(original_tax.tax_rate + TAX_EXEMPT_RATE)
  end

  def self.FOOD(original_tax)
   Tax.new(original_tax.tax_rate + TAX_EXEMPT_RATE)
  end

  def self.OTHER(original_tax)
   Tax.new(original_tax.tax_rate + BASIC_TAX_RATE)
  end

  def self.IMPORTED(original_tax)
   Tax.new(original_tax.tax_rate + IMPORT_TAX_RATE)
  end

  def self.EMPTY # new class with an explicit calculate_tax method that returns just a 0
   Tax.new(0)
  end

  def calculate_tax(price)
   #price_with_tax = @original_tax.calculate_tax(price) + (price * tax_rate)
   #return ("%.2f" %((((price_with_tax).to_f/100)/ROUNDING_TO).ceil) * ROUNDING_TO).to_f
   return ("%.2f" %(((((price * @tax_rate).to_f/100)/ROUNDING_TO).ceil) * ROUNDING_TO)).to_f
  end

  private		#so that no one else can create any new taxations
  def initialize(tax_rate)
    #@original_tax = original_tax
    @tax_rate = tax_rate
  end

end

