require 'receipt.rb'
require 'product.rb'

describe Receipt do
  it "should allow product(s) to be added" do
    book = Product.new("book", 10, "N")
    music_cd = Product.new("music CD", 20, "N")
    chocolate_bar = Product.new("chocolate bar", 1, "N")
    receipt = Receipt.new
    receipt.add_line_item(book)
    receipt.line_items.length.should == 1
    receipt.add_line_item(music_cd)
    receipt.add_line_item(chocolate_bar)
    receipt.line_items.length.should == 3

  end
  
  it "should generate line items when products are added" do
    book = Product.new("book", 10, "N")
    music_cd = Product.new("music CD", 20, "N")
    chocolate_bar = Product.new("chocolate bar", 1, "N")
    receipt = Receipt.new 
    receipt.add_line_item(book)
    receipt.add_line_item(music_cd)
    receipt.add_line_item(chocolate_bar)
    receipt.line_items

  end
  
end

