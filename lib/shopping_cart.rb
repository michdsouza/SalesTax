class ShoppingCart
  attr_reader :total_items, :product
  def initialize
    @total_items = 0
  end

  def add_product(product)
	@product = product
  end
end
