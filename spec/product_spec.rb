require 'product.rb'

describe Product do
  it "should have a type and price" do
    product = Product.new("book", 10, "N")
    product.type.should == "book"
    product.price.should == 10
  end
end

