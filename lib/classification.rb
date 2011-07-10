class Classification

  attr_reader :tax_rate  #it's the classification that governs tax rate. Needs to be attr_read/available for decoration?
    
  TAX_EXEMPT_RATE = 0
  DEFAULT_TAX_RATE = 10
  IMPORT_TAX_RATE = 5

  def self.BOOK		#static objects
   Classification.new(TAX_EXEMPT_RATE)
  end

  def self.MEDICINE
   Classification.new(TAX_EXEMPT_RATE)
  end

  def self.FOOD
   Classification.new(TAX_EXEMPT_RATE)
  end

  def self.OTHER
   Classification.new(DEFAULT_TAX_RATE)
  end

  def self.IMPORTED(classification)
   Classification.new(classification.tax_rate + IMPORT_TAX_RATE)
  end

  private		#so that no one else can create any new classifications
  def initialize(tax_rate)
    @tax_rate = tax_rate  
  end

end

# Not a lot of behavior just yet.
# What is the reason for this class to exist? What is it's intended final behavior!
