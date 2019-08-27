require 'rspec/autorun'  

class Wrapper

    def wrap(string, length_boundry)
        
        # LENGTH
        # If string is less than length_boundry then return the string
      return string if string.length <= length_boundry 
     
        # CONTAINS W.S.??
        # If there is a whitespace between the beginning and length_boundry of the string
      if string[0... length_boundry].index(" ") != nil

        # Set white_space variable to the index of the last occurence of a whitespace within string before length_boundry is reached
        white_space = string[0... length_boundry].rindex(" ")

        # ---If a whitespace occurs within the string before length_boundry is reached
        # Places a new line where the whitespace is within the string
        # Strip the altered strings of their trailing spaces
        # Uses recursion to apply the same conditions to the remainder of the string
        string[0... white_space] + "\n" + wrap(string[white_space+1.. -1], length_boundry)

        # W.S. AT BOUNDRY ??
        # If a whitespace occurs at the length_boundry
        # Add a new line at that index and use recursion to wrap from the next index to the end of the string.
        elsif string[length_boundry] == " "
        string[0... length_boundry] + "\n" + wrap(string[length_boundry.. -1].strip, length_boundry)

        # W.S AFTER BOUNDRY OR WORD SPLIT ??
        # If a whitespace occurs after the length_boundry or if length_boundry splits a string
        # Add a new line after the length_boundry and use recursion to apply the same conditions to the remainder of the string
        else
        string[0... length_boundry].strip + "\n" + wrap(string[length_boundry.. -1], length_boundry)
      end
    end
  
end    

RSpec.describe Wrapper do

    describe "#wrap" do

        it "Should return an empty string when given empty string" do
            wrapper = Wrapper.new

            expect(wrapper.wrap("", 1)).to eq("")
        end

        it "Tests for wrapping the string if string length less than or equal to 
            boundry length" do
            wrapper = Wrapper.new

            expect(wrapper.wrap("word", 4)).to eq("word")
        end

        it "Tests for wrapping if there is a whitespace within the string before  
            the length boundry and wrap from this point." do
            wrapper = Wrapper.new

            expect(wrapper.wrap("word word", 6)).to eq("word\nword")
        end

        it "Tests for wrapping long string at correct space" do
            wrapper = Wrapper.new

            expect(wrapper.wrap("long long word", 11)).to eq("long long\nword")
        end

        it "Tests for correct wrapping when whitespace occurs at the   
            length_boundry" do
            wrapper = Wrapper.new

            expect(wrapper.wrap("word word", 4)).to eq("word\nword")
        end

        it "Tests for wrapping when whitespace occurs after the length_boundry" do
            wrapper = Wrapper.new

            expect(wrapper.wrap("word word", 4)).to eq("word\nword")
        end

        it "Tests for wrapping when length_boundry splits the string" do
            wrapper = Wrapper.new

            expect(wrapper.wrap("longer word", 3)).to eq("lon\nger\nwor\nd")
        end

    end

end    

    




