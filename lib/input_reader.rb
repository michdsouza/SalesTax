require 'yaml'
require './product.rb' #How should this look?
require './tax.rb'
require './receipt.rb'

class Input_Reader
  shopping_carts = (YAML::parse(File.open('../inputs.yml'))).transform
  taxes = (YAML::parse(File.open('../tax_rates.yml'))).transform
  shopping_carts.each do |shopping_cart|
    receipt = Receipt.new
    shopping_cart.each do |product|
      applicable_taxes = []
      product["tax categories"].each do |tax_category|
        applicable_taxes << taxes[tax_category]
      end
      receipt.add_line_item(Product.new(product["product"], product["price"], Tax.Applicable_Taxes(applicable_taxes)))
    end
    puts receipt.list_line_items
    puts receipt.list_tax_total
    puts receipt.list_receipt_total
    puts "\n \n"
  end
end


