class Classification

  attr_reader :tax_rate  #it's the classification that governs tax rate. Needs to be attr_read/available for decoration?
  
  def self.BOOK		#static objects
   Classification.new(0)
  end

  def self.MEDICINE
   Classification.new(0)
  end

  def self.FOOD
   Classification.new(0)
  end

  def self.OTHER
   Classification.new(10)
  end


  def self.IMPORTED(classification)
   Classification.new(classification.tax_rate + 7)
  end

  private		#so that no one else can create any new classifications
  def initialize(tax_rate)
    @tax_rate = tax_rate  
  end

end

# Not a lot of behavior just yet.
# What is the reason for this class to exist? What is it's intended final behavior!
