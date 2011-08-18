require 'product.rb'
require 'tax.rb'

describe Product do

 before (:all) do
    @tax = Tax.EMPTY
    @imported_tax = Tax.new(@tax, 5)
    @basic_tax = Tax.new(@tax, 10)
    @exempt_tax = Tax.new(@tax, 0)
    BASIC_RATE = 10
    IMPORTED_RATE = 5
    EXEMPT_RATE = 0
  end

it "should create a new product with no tax" do
    blanket = Product.new("blanket", 10, @tax)
    blanket.calculate_tax.should == 0
    blanket.price_with_tax.should == 10
  end

  it "should calculate basic tax for a product" do
    blanket = Product.new("blanket", 10, @basic_tax)
    blanket.calculate_tax.should == 1
  end

  it "should calculate price (with tax) for an exempt product" do
    pills = Product.new("pills", 19.95, @exempt_tax)
    pills.price_with_tax.should == 19.95
  end

 it "should calculate price (with tax) for an imported product" do
    tax = Tax.new(@basic_tax, IMPORTED_RATE)
    fancy_blanket = Product.new("fancy blanket", 19.95, tax)
    fancy_blanket.calculate_tax.should == 3.0
    fancy_blanket.price_with_tax.should == 22.95
  end

 it "should calculate price (with tax) for a product regardless of taxation order" do
    tax = Tax.new(@imported_tax, BASIC_RATE)
    fancy_blanket = Product.new("fancy blanket", 19.95, tax)
    fancy_blanket.calculate_tax.should == 3.0
    fancy_blanket.price_with_tax.should == 22.95
  end

 it "should calculate price (with tax) for an imported, exempt product" do
    tax = Tax.new(@imported_tax, EXEMPT_RATE)
    fancy_chocolates = Product.new("box of imported chocolates", 11.25, tax)
    fancy_chocolates.calculate_tax.should == 0.6
    fancy_chocolates.price_with_tax.should == 11.85
  end

end


