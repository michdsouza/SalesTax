require 'yaml'
require './product.rb' #apparently, this is how it should be?
require './tax.rb'
require './receipt.rb'

class Input_Reader
  inputs = YAML::parse(File.open('../inputs.yml'))
  tax_rates = YAML::parse(File.open('../tax_rates.yml'))
  parsed_inputs = inputs.transform
  taxes = tax_rates.transform
  products = []
  receipt = Receipt.new
  parsed_inputs.each do |input|
   input["tax categories"].each do |tax_category|
     receipt.add_line_item(Product.new(input["product"], input["price"], Tax.Applicable_Taxes([10])))
     puts tax_category
     puts taxes[tax_category.to_s]
   end
  end
  puts receipt.list_line_items
end


