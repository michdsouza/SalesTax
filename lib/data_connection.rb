require 'yaml'

class DataConnection
  
  def shopping_carts
    (YAML::parse(File.open('../inputs.yml'))).transform
  end
  
  def tax_rates 
    (YAML::parse(File.open('../tax_rates.yml'))).transform
  end
end
