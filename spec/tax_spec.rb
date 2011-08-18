require 'tax.rb'

describe Tax do

  before (:all) do
    @tax = Tax.EMPTY
    @price = 10
    @imported_tax = Tax.new(@tax, 5)
    @basic_tax = Tax.new(@tax, 10)
    @exempt_tax = Tax.new(@tax, 0)
  end

it "should add no tax for an unspecified tax type" do
    @tax.calculate_tax(@price).should == 0
  end

it "should calculate tax for a basic product" do
    @basic_tax.calculate_tax(@price).should == 1
  end

it "should calculate tax for a basic, imported product" do
    tax = Tax.new(@basic_tax, 5)
    tax.calculate_tax(@price).should == 1.5
  end

end
