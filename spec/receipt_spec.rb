require 'receipt.rb'
require 'product.rb'

describe Receipt do
  it "should allow a product to be added" do
    book = Product.new("book", "10", "N")
    receipt = Receipt.new
    receipt.add(book)
    receipt.print_line_items.should == "book 10"
  end
  
  it "should allow multiple products to be added" do
    book = Product.new("book", "10", "N")
    music_cd = Product.new("music CD", "20", "N")
    chocolate_bar = Product.new("chocolate bar", "1", "N")
    receipt = Receipt.new
    receipt.add(book)
    receipt.add(music_cd)
    receipt.add(chocolate_bar)
    receipt.line_items[0].should be book
    receipt.line_items[1].should be music_cd
    receipt.line_items[2].should be chocolate_bar
    receipt.print_line_items.should == "book 10 music CD 20 chocolate bar 1"
  end
end

