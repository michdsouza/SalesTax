require 'product.rb'

class LineItem

  BASIC_TAX_RATE = 10
  ROUNDING_TO = 0.05

  def initialize(product)
    @quantity = 1
    @description = product.description
    @tax = calculate_tax(product)
    @line_total = product.price + @tax
  end


  def calculate_tax(product)
    if ( product.classification == "medicine" || product.classification == "book" || product.classification == "food" )
       return 0
    else 
       return product.calculate_tax(BASIC_TAX_RATE, ROUNDING_TO)
    end
  end


  def build_output
    return @quantity.to_s + " " + @description + " " + @line_total.to_s
  end

end  
  
