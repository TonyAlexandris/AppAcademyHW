require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }

  subject(:cake) {Dessert.new("cake", 4, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(subject.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(subject.quantity).to eq(4)
    end

    it "starts ingredients as an empty array" do
      expect(subject.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("cake", "a lot", :chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      subject.add_ingredient("ambrosia")
      expect(subject.ingredients).to eq(["ambrosia"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      subject.add_ingredient("ambrosia")
      subject.add_ingredient("leisure")
      subject.add_ingredient("levity")
      before = subject.ingredients.dup
      while subject.ingredients == before
        subject.mix!
      end
      expect(subject.ingredients).to_not eq(before)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      subject.eat(2)
      expect(subject.quantity).to eq(2)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{subject.eat(20)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Title")
      expect(subject.serve).to include("Title")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(subject)
      subject.make_more
    end
  end
end
