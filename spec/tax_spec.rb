require 'tax.rb'

describe Tax do

it "should add no tax for an unspecified tax type" do
    tax = Tax.EMPTY
    price = 10
    tax.calculate_tax(price).should == 0
  end

it "should calculate tax for a basic product" do
    tax = Tax.BASIC(Tax.EMPTY)
    price = 10
    basic_tax_rate = 0.1
    tax.calculate_tax(price).should == 1
  end

it "should calculate tax for a basic, imported product" do
    tax = Tax.BASIC(Tax.IMPORTED(Tax.EMPTY))
    price = 10
    basic_tax_rate = 0.1
    imported_tax_rate = 0.05
    tax.calculate_tax(price).should == 1.5
  end

end
