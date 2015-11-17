te = ["グー", "チョキ", "パー"]

puts "じゃんけんしましょう！"
puts "出したい手と対応する数字を入力してください。"
puts "(9を入力すると終了します)"

loop do
  print "\n何を出しますか？(グー: 0, チョキ: 1, パー: 2) > "
  user = gets.chomp.to_i

  if user == 9
    break
  end

  cpu = rand(3)

  puts "#{te[user]}ですね！コンピュータは#{te[cpu]}です！"

  if user == cpu
    puts "あいこで〜〜"
  elsif user == 0 && cpu == 1
    puts "やった！あなたの勝ちです！"
  elsif user == 1 && cpu == 2
    puts "やった！あなたの勝ちです！"
  elsif user == 2 && cpu == 0
    puts "やった！あなたの勝ちです！"
  else
    puts "残念！あなたの負けです！"
  end
end
