def introduction(name)
  puts "Hi, my name is #{name}."
end

def introduction_with_language(name, language)
  puts "Hi, my name is #{name} and I am learning to program in #{language}."
end

puts "Hello, can you please introduce yourself?"
name = gets.strip
introduction(name)
puts "Sry, I could barely hear you, what is your name and what language are you fluent in?"
name = gets.strip
language = gets.strip
introduction_with_language(name, language)