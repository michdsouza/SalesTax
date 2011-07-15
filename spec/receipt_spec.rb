require 'receipt.rb'
require 'product.rb'
require 'tax.rb'

describe Receipt do
  it "should format results for one added product" do
    imported_card = Product.new("greeting card", 21.40, Tax.IMPORTED(Tax.OTHER(Tax.EMPTY)))
    receipt = Receipt.new
    receipt.add_line_item(imported_card)
    receipt.list_line_items.should == "1 greeting card: 24.65"
  end

  it "should generate line items when several products are added" do
    imported_perfume = Product.new("imported bottle of perfume", 27.99, Tax.IMPORTED(Tax.OTHER(Tax.EMPTY)))
    perfume = Product.new("bottle of perfume", 18.99, Tax.OTHER(Tax.EMPTY))
    pills = Product.new("packet of headache pills", 9.75, Tax.MEDICINE(Tax.EMPTY))
    imported_chocolates = Product.new("box of imported chocolates", 11.25, Tax.IMPORTED(Tax.FOOD(Tax.EMPTY)))
    receipt = Receipt.new
    receipt.add_line_item(imported_perfume)
    receipt.add_line_item(perfume)
    receipt.add_line_item(pills)
    receipt.add_line_item(imported_chocolates)
    receipt.list_line_items.should == "1 imported bottle of perfume: 32.19\n1 bottle of perfume: 20.89\n1 packet of headache pills: 9.75\n1 box of imported chocolates: 11.85"
  end
end






