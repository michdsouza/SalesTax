require 'product.rb'

class LineItem

  def initialize(product)
    @quantity = 1
    @description = product.description
    #@tax = calculate_sales_tax(product)
    @line_total = product.price + 2
  end

  def build_output
    return @quantity.to_s + " " + @description + " " + @line_total.to_s
  end

end  
  
