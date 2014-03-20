require 'spec_helper'
# Require checkout here 

describe "Exercise integration specs" do
  # Replace mock objects with your own implementations (both items and pricing 
  # rules)
  let( :item_a ) { double price: 50 }
  let( :item_b ) { double price: 30 }
  let( :item_c ) { double price: 20 }
  let( :item_d ) { double price: 15 }

  let( :pricing_rules ) { double }

  subject { Checkout.new( pricing_rules ) }

  context "when no discount present" do
    it "returns the expected result for the given case" do
      subject.scan( item_c )
      expect( subject.total ).to eq 20
    end
    it "returns the expected result for the given case" do
      subject.scan( item_c )
      subject.scan( item_d )
      expect( subject.total ).to eq 35
    end
    it "returns the expected result for the given case" do
      subject.scan( item_c )
      subject.scan( item_b )
      expect( subject.total ).to eq 50 
    end
  end

  context "when only double discount present" do
    it "returns the expected result for the given case" do
      subject.scan( item_b )
      expect( subject.total ).to eq 30
    end
    it "returns the expected result for the given case" do
      subject.scan( item_b )
      subject.scan( item_b )
      expect( subject.total ).to eq 45
    end
    it "returns the expected result for the given case" do
      subject.scan( item_b )
      subject.scan( item_b )
      subject.scan( item_b )
      expect( subject.total ).to eq 75
    end
  end

  context "when only triple discount present" do
    it "returns the expected result for the given case" do
      subject.scan( item_a )
      expect( subject.total ).to eq 50
    end
    it "returns the expected result for the given case" do
      subject.scan( item_a )
      subject.scan( item_a )
      expect( subject.total ).to eq 100
    end
    it "returns the expected result for the given case" do
      subject.scan( item_a )
      subject.scan( item_a )
      subject.scan( item_a )
      expect( subject.total ).to eq 130
    end
    it "returns the expected result for the given case" do
      subject.scan( item_a )
      subject.scan( item_a )
      subject.scan( item_a )
      subject.scan( item_a )
      expect( subject.total ).to eq 180
    end
  end

  context "when mixed behaviours" do
    it "returns the expected result for the given case" do
      subject.scan( item_a )
      subject.scan( item_a )
      subject.scan( item_c )
      subject.scan( item_b )
      subject.scan( item_b )
      expect( subject.total ).to eq 165
    end
    it "returns the expected result for the given case" do
      subject.scan( item_a )
      subject.scan( item_a )
      subject.scan( item_a )
      subject.scan( item_c )
      subject.scan( item_c )
      expect( subject.total ).to eq 170
    end
    it "returns the expected result for the given case" do
      subject.scan( item_a )
      subject.scan( item_a )
      subject.scan( item_a )
      subject.scan( item_b )
      expect( subject.total ).to eq 160
    end
  end

end