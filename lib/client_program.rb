require './data_connection.rb'
require './product.rb' #How should this look?
require './tax.rb'
require './receipt.rb'

class Client_Program
  data_connection = Data_Connection.new
  shopping_carts = data_connection.shopping_carts
  tax_rates = data_connection.tax_rates
  
  shopping_carts.each do |shopping_cart|
    receipt = Receipt.new
    shopping_cart.each do |product|
      applicable_taxes = []
      product["tax categories"].each do |tax_category|
        applicable_taxes << tax_rates[tax_category]
      end
      receipt.add_line_item(Product.new(product["product"], product["price"], Tax.Applicable_Taxes(applicable_taxes)))
    end
    puts receipt.list_line_items
    puts receipt.list_tax_total
    puts receipt.list_receipt_total
    puts "\n \n"
  end
end


