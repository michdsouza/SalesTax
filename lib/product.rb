class Product
  attr_reader :type, :price, :is_imported

  def initialize(type, price, is_imported)
    @type = type
    @price = price
    @is_imported = is_imported
  end
		
end
