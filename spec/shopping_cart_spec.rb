require 'shopping_cart.rb'
require 'product.rb'

describe ShoppingCart do
  it "should be empty" do
    cart = ShoppingCart.new
    cart.total_items.should be 0
  end

  it "should allow an item to be added to it" do
    cart = ShoppingCart.new
    book = Product.new("book", "10", "N")
    cart.add_product(book)
    cart.product.should be book
  end
     
end

