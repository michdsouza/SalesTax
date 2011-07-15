require 'product.rb'
require 'tax.rb'

describe Product do

  it "should calculate basic tax for a product" do
    blanket = Product.new("blanket", 10, Tax.OTHER(Tax.EMPTY))
    blanket.calculate_tax.should == 1
  end

  it "should calculate price (with tax) for an exempt product" do
    pills = Product.new("pills", 19.95, Tax.MEDICINE(Tax.EMPTY))
    pills.price_with_tax.should == 19.95
  end

 it "should calculate price (with tax) for an imported product" do
    fancy_blanket = Product.new("fancy blanket", 19.95, Tax.IMPORTED(Tax.OTHER(Tax.EMPTY)))
    fancy_blanket.calculate_tax.should == 3.0
    fancy_blanket.price_with_tax.should == 22.95
  end

 it "should calculate price (with tax) for a product regardless of taxation order" do
    fancy_blanket = Product.new("fancy blanket", 19.95, Tax.OTHER(Tax.IMPORTED(Tax.EMPTY)))
    fancy_blanket.calculate_tax.should == 3.0
    fancy_blanket.price_with_tax.should == 22.95
  end


 it "should calculate price (with tax) for an imported, exempt product" do
    fancy_chocolates = Product.new("box of imported chocolates", 11.25, Tax.IMPORTED(Tax.FOOD(Tax.EMPTY)))
    fancy_chocolates.calculate_tax.should == 0.6 #still need this...for tax summation
    fancy_chocolates.price_with_tax.should == 11.85
  end

end


