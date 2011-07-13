class Product
  attr_reader :description # just needed for receipt formatting. Ugly. Permanent?

  def initialize(description, price, classification)
    @description = description
    @price = price
    @classification = classification
  end

  def price_with_tax(rounding_to)
   return ("%.2f" %(@price + calculate_tax(rounding_to))).to_f
  end

 def calculate_tax(rounding_to)
   return ("%.2f" %(((((@price * @classification.tax_rate).to_f/100)/rounding_to).ceil) * rounding_to)).to_f
   #return ((((@price * @classification.tax_rate).to_f/100)/rounding_to).ceil) * rounding_to
  end
	
end

