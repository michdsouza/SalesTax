class Product

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
   @tax.calculate_tax(@price)
  end
	
end

