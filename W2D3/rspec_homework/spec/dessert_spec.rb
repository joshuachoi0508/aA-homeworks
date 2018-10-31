require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:dessert) { Dessert.new("cake", 20, chef) }
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(20)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "10", chef) }.to raise_error
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(dessert.add_ingredient('flour')).to include('flour')
    end
  end

  describe "#mix!" do
    before(:each) { dessert.add_ingredient('chocolate') }

    it "shuffles the ingredient array" do
      dessert.add_ingredient('flour')
      dessert.add_ingredient('egg')
      dessert.add_ingredient('salt')
      dessert.add_ingredient('sugar')
      expect(dessert.mix!).to_not eq(['chocolate', 'flour', 'egg', 'salt', 'sugar'])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(dessert.eat(1)).to eq(19)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{ dessert.eat(100) }.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Choi")
      expect(dessert.serve).to eq("Chef Choi has made 20 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
