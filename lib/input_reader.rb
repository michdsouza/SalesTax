require 'yaml'
require './product.rb' #fix this
require './tax.rb' # fix this
require './receipt.rb' # fix this

class Input_Reader
  inputs = YAML::parse(File.open('../inputs.yml'))
  parsed_inputs = inputs.transform
  products = []
  receipt = Receipt.new
  parsed_inputs.each do |input|
   receipt.add_line_item(Product.new(input["product"], input["price"], Tax.BASIC(Tax.EMPTY)))
  end
  puts receipt.list_line_items
end


