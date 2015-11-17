te = ["グー", "チョキ", "パー"]
judge = {
  0 => 1,
  1 => 2,
  2 => 0
}

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
  elsif judge[user] == cpu
    puts "やった！あなたの勝ちです！"
  else
    puts "残念！あなたの負けです！"
  end
end
