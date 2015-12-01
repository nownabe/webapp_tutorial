print "何か入力してください > "
str = gets.chomp
str.each_char do |char|
  print char * 2
end
puts