require "my_uniq.rb"
require "rspec"

describe "#my_uniq" do
    subject(:array) {Array.new}
    let(:arr_1) { [1, 2, 1, 3, 3] }

    it "expects receiver to be an instance of Array" do
        expect(array.my_uniq).to be_an_instance_of(Array) 
    end

    it "should return a new array with unique elements" do
        expect(arr_1.my_uniq).to eq([1, 2, 3])
    end 

    it "should not mutate the original array" do 
        expect(arr_1.object_id).to_not eq(arr_1.my_uniq.object_id)
    end 

    it "should not receive Array#uniq method" do 
        expect(array).to_not receive(:uniq)
        array.my_uniq {}
    end
end

describe "#two_sum" do 
    subject(:array) {Array.new}
    let(:arr_1) { [-1, 0, 2, -2, 1] }

    it "expects receiver to be an instance of Array" do
        expect(array.two_sum).to be_an_instance_of(Array) 
    end

    it "should return" do 
        expect(arr_1.two_sum).to eq([[0, 4], [2, 3]])
    end 
end 

describe "#my_transpose" do 
    #subject(:array) { Array.new(array.length) {Array.new(array.length)} }
    let (:arr_1) { [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
    ] }
    
    it "expects receiver to be an instance of Array" do
        expect(arr_1).to be_an_instance_of(Array) 
    end

    it "expects receiver to be a 2D array" do 
        expect(my_transpose(arr_1)).to_not eq(arr_1.flatten)
    end 

    it "should return the transposed array" do 
        expect(my_transpose(arr_1)).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end
end 

describe "stock_picker" do 
    let (:arr_1) { [3, 5, 7, 6, 8, 2] }

    it "expects receiver to be an instance of Array" do
        expect(stock_picker(arr_1)).to be_an_instance_of(Array) 
    end

    it "should return the most profitable pair" do 
        expect(stock_picker(arr_1)).to eq([3, 8])
    end 
end 