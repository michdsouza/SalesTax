class Product
  attr_reader :description, :price, :classification # bogus if these are only used by the tests..?

  def initialize(description, price, classification)
    @description = description
    @price = price
    @classification = classification
  end

  def price_with_tax(rounding_to)
   return @price + calculate_tax(rounding_to)
  end

  def calculate_tax(rounding_to)
    return ((((@price * @classification.tax_rate).to_f/100)/rounding_to).ceil) * rounding_to
  end
	
end

# kill off the attr_readers.
