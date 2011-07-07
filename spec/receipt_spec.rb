require 'receipt.rb'
require 'product.rb'

describe Receipt do
  it "should allow product(s) to be added" do
    book = Product.new("book", 10)
    music_cd = Product.new("music CD", 20)
    chocolate_bar = Product.new("chocolate bar", 1)
    receipt = Receipt.new
    receipt.add_line_item(book)
    receipt.line_items.length.should == 1
    receipt.add_line_item(music_cd)
    receipt.add_line_item(chocolate_bar)
    receipt.line_items.length.should == 3

  end
  
  it "should generate line items when products are added" do
    book = Product.new("book", 10)
    music_cd = Product.new("music CD", 20)
    chocolate_bar = Product.new("chocolate bar", 1)
    chocolate_bar.calculate_tax(10, 0.05).should == 0.1
    receipt = Receipt.new 
    receipt.add_line_item(book)
    receipt.add_line_item(music_cd)
    receipt.add_line_item(chocolate_bar)
    receipt.line_items[0].build_output.should == "1 book 11.0"
    receipt.line_items[1].build_output.should == "1 music CD 22.0"
    receipt.line_items[2].build_output.should == "1 chocolate bar 1.1"
  end
  
end

