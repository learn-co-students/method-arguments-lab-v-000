def introduction name 
=begin 
  I won't do this in the future, but it's helpful to know that I can technically 
  write the method signature without enclosing the argument(s) between parentheses.
  Also, #print will not work since the test is expecting a new line. 
=end
  puts "Hi, my name is #{name}."
end

def introduction_with_language(name, language)
  puts "Hi, my name is #{name} and I am learning to program in #{language}."
end