require 'receipt.rb'
require 'product.rb'
require 'tax.rb'

describe Receipt do
  
   BASIC_SALES_TAX_RATE = 10
   IMPORTED_SALES_TAX_RATE = 5
   EXEMPT_SALES_TAX_RATE = 0

  it "should format results for one added product" do
    tax = Tax.EMPTY
    tax = Tax.new(tax, BASIC_SALES_TAX_RATE)
    tax = Tax.new(tax, IMPORTED_SALES_TAX_RATE)
    imported_card = Product.new("greeting card", 21.40, tax)
    receipt = Receipt.new
    receipt.add_line_item(imported_card)
    receipt.list_line_items.should == "1 greeting card: 24.65"
  end

  it "should generate line items when several products are added" do
    tax = Tax.EMPTY
    tax = Tax.new(tax, BASIC_SALES_TAX_RATE)
    tax = Tax.new(tax, IMPORTED_SALES_TAX_RATE)    
    imported_perfume = Product.new("imported bottle of perfume", 27.99, tax)
    tax = Tax.EMPTY
    tax = Tax.new(tax, BASIC_SALES_TAX_RATE)
    perfume = Product.new("bottle of perfume", 18.99, tax)
    tax = Tax.EMPTY
    tax = Tax.new(tax, EXEMPT_SALES_TAX_RATE)
    pills = Product.new("packet of headache pills", 9.75, tax)
    tax = Tax.EMPTY
    tax = Tax.new(tax, IMPORTED_SALES_TAX_RATE)    
    tax = Tax.new(tax, EXEMPT_SALES_TAX_RATE)
    imported_chocolates = Product.new("box of imported chocolates", 11.25, tax)
    receipt = Receipt.new
    receipt.add_line_item(imported_perfume)
    receipt.add_line_item(perfume)
    receipt.add_line_item(pills)
    receipt.add_line_item(imported_chocolates)
    receipt.list_line_items.should == "1 imported bottle of perfume: 32.19\n1 bottle of perfume: 20.89\n1 packet of headache pills: 9.75\n1 box of imported chocolates: 11.85"
  end

  it "should generate correct sales tax total when several products are added" do
    tax = Tax.EMPTY
    tax = Tax.new(tax, IMPORTED_SALES_TAX_RATE)    
    tax = Tax.new(tax, EXEMPT_SALES_TAX_RATE)
    imported_chocolates = Product.new("imported box of chocolates", 10.00, tax)
    tax = Tax.EMPTY
    tax = Tax.new(tax, BASIC_SALES_TAX_RATE)    
    tax = Tax.new(tax, IMPORTED_SALES_TAX_RATE)
    imported_perfume = Product.new("imported bottle of perfume", 47.50, tax)
    receipt = Receipt.new
    receipt.add_line_item(imported_chocolates)
    receipt.add_line_item(imported_perfume)
    receipt.list_tax_total.should == "Sales Taxes: 7.65"
  end

  it "should generate receipt total when several products are added" do
    tax = Tax.EMPTY
    tax = Tax.new(tax, IMPORTED_SALES_TAX_RATE)    
    tax = Tax.new(tax, BASIC_SALES_TAX_RATE)
    imported_perfume = Product.new("imported bottle of perfume", 27.99, tax)
    tax = Tax.EMPTY
    tax = Tax.new(tax, BASIC_SALES_TAX_RATE)    
    perfume = Product.new("bottle of perfume", 18.99, tax)
    tax = Tax.EMPTY
    tax = Tax.new(tax, EXEMPT_SALES_TAX_RATE)    
    pills = Product.new("packet of headache pills", 9.75, tax)
    tax = Tax.EMPTY
    tax = Tax.new(tax, EXEMPT_SALES_TAX_RATE)    
    tax = Tax.new(tax, IMPORTED_SALES_TAX_RATE)    
    imported_chocolates = Product.new("box of imported chocolates", 11.25, tax)
    receipt = Receipt.new
    receipt.add_line_item(imported_perfume)
    receipt.add_line_item(perfume)     
    receipt.add_line_item(pills)
    receipt.add_line_item(imported_chocolates)
    receipt.list_receipt_total.should == "Total: 74.68"
  end


end






