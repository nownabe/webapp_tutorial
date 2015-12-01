print "何か入力してください > "
str = gets.chomp
puts str.gsub(/Hello|hello/, "こんにちは")