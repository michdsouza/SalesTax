class Receipt
  attr_accessor :line_items
  
  def initialize
    @line_items = Array.new
  end
  
  def add(product)
    @line_items.push(product)
  end
    
  def print_line_items
    return @line_items.map { |product| product.type + " " + product.price }.join(" ")
  end
		
end
