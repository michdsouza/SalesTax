require 'tax.rb'

describe Tax do

it "should add no tax for an unspecified tax type" do
    tax = Tax.EMPTY
    price = 10
    tax.calculate_tax(price).should == 0
  end

it "should calculate tax for a basic product" do
    tax = Tax.EMPTY
    tax = Tax.new(tax, 10)
    price = 10
    tax.calculate_tax(price).should == 1
  end

it "should calculate tax for a basic, imported product" do
    tax = Tax.EMPTY
    tax = Tax.new(tax, 10)
    tax = Tax.new(tax, 5)
    price = 10
    tax.calculate_tax(price).should == 1.5
  end

end
