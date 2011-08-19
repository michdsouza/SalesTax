class Product

  ROUNDING_TO = 0.05

  def initialize(description, price, tax)
    @description = description
    @price = price
    @tax = tax
  end

  def format_description
   return @description
  end  

  def price_with_tax
   return ("%.2f" %(@price + calculate_tax)).to_f
  end

  def calculate_tax
   raw_tax = @tax.calculate_tax(@price)
   ("%.2f" %(((raw_tax/ROUNDING_TO).ceil) * ROUNDING_TO)).to_f
  end
	
end

