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


end

