require './data_connection.rb'
require './product.rb'
require './tax.rb'
require './receipt.rb'

data_connection = DataConnection.new
shopping_carts = data_connection.shopping_carts
tax_rates = data_connection.tax_rates

shopping_carts.each do |shopping_cart|
  receipt = Receipt.new
  shopping_cart.each do |product|
    tax = Tax.EMPTY
    product["tax categories"].each do |tax_category|
      tax = Tax.new(tax, tax_rates[tax_category])
    end
    receipt.add_line_item(Product.new(product["product"], product["price"], tax))
  end
  puts receipt.list_line_items
  puts receipt.list_tax_total
  puts receipt.list_receipt_total
  puts "\n \n"
end


