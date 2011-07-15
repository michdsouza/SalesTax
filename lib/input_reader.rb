require 'yaml'
require './product.rb' #fix this
require './tax.rb' # fix this

class Input_Reader
  inputs = YAML::load(File.open('../inputs.yml'))  #what's the right way to do this?
  products = []
  inputs.each do |description, quantity, price, tax_classification|
    products << Product.new(description, price, Tax.BASIC(Tax.EMPTY))   # tax rate will eventually come from outside
  end
end
