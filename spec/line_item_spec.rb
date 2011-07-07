require 'line_item.rb'
require 'product.rb'

describe LineItem do
  it "should calculate correct tax for a product" do
    blanket = Product.new("blanket", 10)
    blanket_line_item = LineItem.new(blanket)
    blanket_line_item.build_output.should == "1 blanket 11.0"
  end
end
