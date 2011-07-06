require 'line_item.rb'
require 'product.rb'

describe LineItem do
  it "should build correct output for a product" do
    blanket = Product.new("blanket", 10, "N")
    blanket_line_item = LineItem.new(blanket)
    blanket_line_item.build_output.should == "1 blanket 12"
  end
end
