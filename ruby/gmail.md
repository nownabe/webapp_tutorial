# おまけ: Gmail with Ruby
## 概要
RubyからGmailを使っていい感じの日報メールを送信するプログラムを作ってみます。
下のようなメールをRubyのプログラムから送信することが目標です。

![](mail.png)

このフォーマットはあくまでも例で、HTMLで好きなようにカスタマイズできるようになっています。

今回はRubyでコンソールからの送信になりますが、最終的にはWebアプリでメールを送信できるようにします。

## 全ソースコード

```ruby
require "gmail"

# 設定
USERNAME = "Gmailのメールアドレス"
PASSWORD = "アプリパスワード"
MYNAME   = "名前"
TO = ["宛先1", "宛先2"]

# メソッド定義
def get_list(list_name)
  puts "#{list_name}を入力してください。"
  puts "何も入力せずEnterすると次へ進みます。"

  list = []
  loop do
    print "> "
    task = gets.chomp
    if task.empty?
      break
    else
      list.push(task)
    end
  end
  list
end

def print_list(list)
  list.each { |element| puts "- #{element}" }
end

### ここからプログラム開始 ###

# ユーザの入力
## 本日の業務
today_tasks = get_list("本日の業務")
puts # 空行出力

## 翌日の業務
tomorrow_tasks = get_list("翌日の業務")
puts

## 所感
impressions = get_list("所感")
puts

# 確認
puts "以下の内容でメールを送信します。"
puts "================"
puts "# 本日の業務"
print_list(today_tasks)
puts
puts "# 翌日の業務"
print_list(tomorrow_tasks)
puts
puts "# 所感"
print_list(impressions)
puts "================"
print "よろしいですか？[Y/n] "
confirm = gets.chomp

## Yes (y or Y or 空Enter) 以外ならプログラムを終了する
if !(confirm == "y" || confirm == "Y" || confirm.empty?)
  puts "処理を中断します。"
  exit 1
end

# 本文HTML生成
date = Time.now.strftime("%Y/%m/%d")
html = "<h2>日報 #{date} (#{MYNAME})</h2>"

## 本日の業務
html.concat "<h3>本日の業務</h3>"
html.concat "<ul>"
today_tasks.each do |task|
  html.concat "<li>#{task}</li>"
end
html.concat "</ul>"

## 翌日の業務
html.concat "<h3>翌日の業務</h3>"
html.concat "<ul>"
tomorrow_tasks.each do |task|
  html.concat "<li>#{task}</li>"
end
html.concat "</ul>"

## 所感
html.concat "<h3>所感</h3>"
html.concat "<ul>"
impressions.each do |impression|
  html.concat "<li>#{impression}</li>"
end
html.concat "</ul>"

# メール送信
gmail = Gmail.new(USERNAME, PASSWORD)

message = gmail.generate_message do
  to(TO)
  subject("[日報] #{date} #{MYNAME}")
  html_part do
    content_type("text/html; charset=UTF-8")
    body(html)
  end
end

gmail.deliver(message)
gmail.logout
```