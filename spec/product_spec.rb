require 'product.rb'

describe Product do
  it "should have a description and price" do
    product = Product.new("book", 11, "N")
    product.description.should == "book"
    product.price.should == 11
  end

  it "should calculate basic tax" do
    blanket = Product.new("blanket", 10, "N")
    blanket.calculate_tax(10).should == 1
  end
end
