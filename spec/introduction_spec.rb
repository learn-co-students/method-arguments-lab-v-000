require "spec_helper"

describe "#introduction" do 
  it "takes in an argument of a name and puts out a phrase with that name using string interpolation" do 
    expect{introduction("Josh")}.to output("Hi, my name is Josh.\n").to_stdout
    expect{introduction("Jill")}.to output("Hi, my name is Jill.\n").to_stdout
  end
end

describe "#introduction_with_language" do 
  it "takes in two arguments, a name and a language, and puts out a phrase using those arguments." do 
    expect{introduction_with_language("Richard", "Ruby")}.to output("Hi, my name is Richard and I am learning to program in Ruby.\n").to_stdout
    expect{introduction_with_language("Patricia", "Python")}.to output("Hi, my name is Patricia and I am learning to program in Python.\n").to_stdout
  end
end