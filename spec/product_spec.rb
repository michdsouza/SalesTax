require 'product.rb'
require 'tax.rb'

describe Product do

it "should create a new product with no tax" do
    blanket = Product.new("blanket", 10, Tax.applicable_taxes([]))
    blanket.calculate_tax.should == 0
    blanket.price_with_tax.should == 10
  end

  it "should calculate basic tax for a product" do
    blanket = Product.new("blanket", 10, Tax.applicable_taxes([10]))
    blanket.calculate_tax.should == 1
  end

  it "should calculate price (with tax) for an exempt product" do
    pills = Product.new("pills", 19.95, Tax.applicable_taxes([0]))
    pills.price_with_tax.should == 19.95
  end

 it "should calculate price (with tax) for an imported product" do
    fancy_blanket = Product.new("fancy blanket", 19.95, Tax.applicable_taxes([10, 5]))
    fancy_blanket.calculate_tax.should == 3.0
    fancy_blanket.price_with_tax.should == 22.95
  end

 it "should calculate price (with tax) for a product regardless of taxation order" do
    fancy_blanket = Product.new("fancy blanket", 19.95, Tax.applicable_taxes([5, 10]))
    fancy_blanket.calculate_tax.should == 3.0
    fancy_blanket.price_with_tax.should == 22.95
  end

 it "should calculate price (with tax) for an imported, exempt product" do
    fancy_chocolates = Product.new("box of imported chocolates", 11.25, Tax.applicable_taxes([5, 0]))
    fancy_chocolates.calculate_tax.should == 0.6   #used in tax summation
    fancy_chocolates.price_with_tax.should == 11.85
  end

end


