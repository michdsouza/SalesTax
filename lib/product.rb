class Product
  attr_reader :description # just needed for receipt formatting. Ugly. Permanent?

  def initialize(description, price, tax)
    @description = description
    @price = price
    @tax = tax
  end

  def price_with_tax
   return ("%.2f" %(@price + calculate_tax)).to_f
  end

  def calculate_tax # should this be duplicated with Tax??
   @tax.calculate_tax(@price)
  end
	
end

