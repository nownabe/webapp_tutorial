greetings = {
  "日本" => "こんにちは",
  "アメリカ" => "hello",
  "中国" => "你好"
}

print "国名を入力してください > "
country = gets.chomp

if greetings.key?(country)
  puts "#{country}の挨拶は#{greetings[country]}です。"
else
  puts "#{country}は登録されていません。"
end
