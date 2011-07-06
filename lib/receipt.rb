require 'line_item.rb'

class Receipt
  attr_reader :line_items   #Just for the test. Is the test flawed?
  BASIC_SALES_TAX_RATE = 10
  
  def initialize
    @line_items = []
  end
  
  def add_line_item(product)
    line_item = LineItem.new(product)
    @line_items.push(line_item)
  end
  
  #def calculate_sales_tax(product)
  #  return 2
    #return (product.price * BASIC_SALES_TAX_RATE)/100
  #end
    
  def list_line_items
    return @line_items.collect { |line_item| line_item.build_output }.join(" ")
  end
		
end
