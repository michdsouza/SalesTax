require 'product.rb'
require 'classification.rb'

describe Product do

  it "should calculate basic tax for a product" do
    blanket = Product.new("blanket", 10, Classification.OTHER)
    blanket.calculate_tax(0.05).should == 1
  end

  it "should calculate price (with tax) for an exempt product" do
    pills = Product.new("pills", 19.95, Classification.MEDICINE)
    pills.price_with_tax(0.05).should == 19.95
  end

 it "should calculate price (with tax) for an imported product" do
    fancy_blanket = Product.new("fancy blanket", 19.95, Classification.IMPORTED(Classification.OTHER))
    fancy_blanket.calculate_tax(0.05).should == 3.0
    fancy_blanket.price_with_tax(0.05).should == 22.95
  end
# Is this strange? Perhaps, myproduct = Product.IMPORTED(myproduct)?
# How about myproduct = Classification.IMPORTED(myproduct)?
# GAH!

 it "should calculate price (with tax) for an imported, exempt product" do
    fancy_chocolates = Product.new("box of imported chocolates", 11.25, Classification.IMPORTED(Classification.FOOD))
    fancy_chocolates.calculate_tax(0.05).should == 0.6 #still need this...for tax summation
    fancy_chocolates.price_with_tax(0.05).should == 11.85
  end

end


