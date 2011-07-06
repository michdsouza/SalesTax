class Product
  attr_reader :description, :price, :classification # bogus if these are only used by the tests..?

  def initialize(description, price)
    @description = description
    @price = price
    @classification = classify

  end

  def classify
    #return "medicine" #will be calculated by some logic that maps product.description to a bunch of product classifications
    return "not medicine"
  end

  def calculate_tax(tax_rate)
    return (@price * tax_rate)/100
  end

		
end
