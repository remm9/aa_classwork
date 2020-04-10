require "rspec"
require "game.rb"

describe Towers_of_Hanoi do 
    subject(:towers) { Towers_of_Hanoi.new }


    describe "#initialize" do 
        it "starts with a 2D array" do
            expect(towers.arr).to_not eq(towers.arr.flatten)
        end

        it "starts with first subarray being a full stack" do 
            expect(towers.arr[0]).to eq([3, 2, 1])
        end  
    end

    describe "#move" do

        it "should raise error if given an invalid position" do 
            expect{towers.move(1, 4)}.to raise_error("Out of bounds")
        end 
    
        it "should move disk form starting to ending position" do 
            towers.move(0, 2) #=> [ [3,2], [], [1] ]
            expect(towers.arr).to eq([[3,2], [], [1]])
        end
    end 

    describe "#won?" do 
        it "should return true if last stack is sorted in reversed order" do
            expect(towers.arr[2]).to eq(towers.arr[2].sort.reverse)
        end 
    end 

    describe "#play" do 
        it "should print the current state of the game" do 
            expect(towers.play).to eq(puts towers.arr)
        end
        
        # it "get input from user" do
        #     expect(towers.play).to receive(:gets.chomp)
        # end

        # it "should translate input into array position" do 
        #     expect(gets.chomp).to eq(2)
        # end
    end
end 