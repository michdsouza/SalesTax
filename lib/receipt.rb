require 'line_item.rb'

class Receipt
  BASIC_SALES_TAX_RATE = 10
  attr_accessor :line_items
  
  def initialize
    @line_items = Array.new
  end
  
  def add_line_item(product)
    line_item = LineItem.new
    line_item.quantity = 1
    line_item.description = product.type
    line_item.tax = calculate_sales_tax(product)
    line_item.price = product.price + line_item.tax
    @line_items.push(line_item)
  end
  
  def calculate_sales_tax(product)
    return 2
    #return (product.price * BASIC_SALES_TAX_RATE)/100
  end
    
  def print_line_items
    return @line_items.map { |line_item| line_item.quantity + " " + line_item.description + " " + line_item.price }.join(" ")
  end
		
end
