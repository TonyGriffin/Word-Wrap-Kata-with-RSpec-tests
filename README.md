# Word-Wrap-Kata-with-RSpec-tests

# Installed RSpec gem

# Allowed me to run kata ruby code and RSpec testing code in the one file
require "rspec/autorun"  

# To Use:
in terminal....
cd to word wrap directory in local drive
run in terminal:  " ruby word_wrap.rb ", when reviewing test results


# Code without coments:

require 'rspec/autorun'  

class Wrapper

    def wrap(string, length_boundry)

      return string if string.length <= length_boundry 
        
      if string[0... length_boundry].index(" ") != nil
        white_space = string[0... length_boundry].rindex(" ")
        string[0... white_space] + "\n" + wrap(string[white_space+1.. -1], length_boundry)
        
        elsif 
          string[length_boundry] == " "
          string[0... length_boundry] + "\n" + wrap(string[length_boundry.. -1].strip, length_boundry)
          
          else
            string[0... length_boundry].strip + "\n" + wrap(string[length_boundry.. -1], length_boundry)
      end
    end
  
end   
