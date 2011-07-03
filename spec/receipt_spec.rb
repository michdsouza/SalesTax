require 'receipt.rb'
require 'product.rb'

describe Receipt do
  it "should allow a line item to be added" do
    book = Product.new("book", "10", "N")
    receipt = Receipt.new(book)
    receipt.line_item.should == "book 10"
  end
end

