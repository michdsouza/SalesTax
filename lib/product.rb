class Product
  attr_reader :description, :price, :is_imported

  def initialize(description, price, is_imported)
    @description = description
    @price = price
    @is_imported = is_imported
  end

  def calculate_tax(tax_rate)
    return (@price * tax_rate)/100
  end
		
end
