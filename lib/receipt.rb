class Receipt

  ROUNDING_TO = 0.05
  
  def initialize
    @line_items = []
  end
  
  def add_line_item(product)
    @line_items << product
  end
     
  def list_line_items
    line_item_data = @line_items.collect do  |line_item|
       "1 " + line_item.description + " " + line_item.price_with_tax(ROUNDING_TO).to_s
    end
    line_item_date.join("\n")
  end
end

#Rceipts care about formatting, and about the contents of its individual line items.
