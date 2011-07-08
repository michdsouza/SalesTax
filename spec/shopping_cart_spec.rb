require 'product.rb'

describe ShoppingCart do
  it "should be empty" do
  pending
    cart = ShoppingCart.new
    cart.total_items.should be 0
  end

  it "should allow an item to be added to it" do
  pending
    cart = ShoppingCart.new
    book = Product.new("book", "10")
    cart.add_product(book)
    cart.product.should be book
  end
     
end

