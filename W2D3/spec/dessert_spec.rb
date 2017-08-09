require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:dessert) { Dessert.new("brownie", 50, chef) }
  let(:chef) { double("chef", name: "Adrian" ) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new("brownie", "a", "Adrian") }.to raise_error
    end

  end

  describe "#add_ingredient" do
    subject(:dessert) { Dessert.new("brownie", 50, "Adrian") }

    # before(:each) do
    #   dessert.add_ingredient("chocolate")
    #   dessert.add_ingredient("milk")
    #   dessert.add_ingredient("flour")
    # end

    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("chocolate")
      expect(dessert.ingredients).to eq(["chocolate"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = (0..1000).to_a
      ingredients.each { |el| dessert.add_ingredient(el) }
      dessert.mix!
      expect(dessert.ingredients).not_to eq(ingredients)
      expect(dessert.ingredients.sort).to eq(ingredients)
    end

  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(10)
      expect(dessert.quantity).to eq(40)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{dessert.eat(60)}.to raise_error('not enough left!')
    end

  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Adrian the Great Baker")
      expect(dessert.serve).to eq("Chef Adrian the Great Baker has made 50 brownies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end

end
