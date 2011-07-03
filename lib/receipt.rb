class Receipt

  def initialize(product)
   @product = product
  end

  def line_item
   return "#{@product.type} #{@product.price}"
  end
		
end
