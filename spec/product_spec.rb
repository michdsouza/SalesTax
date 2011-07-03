require 'product.rb'

describe Product do
  it "should have a type and price" do
    product = Product.new("book", 11, "N")
    product.type.should == "book"
    product.price.should == 11
  end
end

