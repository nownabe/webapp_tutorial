# おまけ: Gmail with Ruby
## 概要
RubyからGmailを使っていい感じの日報メールを送信するプログラムを作ってみます。
下のようなメールをRubyのプログラムから送信することが目標です。

![](mail.png)

このフォーマットはあくまでも例で、HTMLで好きなようにカスタマイズできるようになっています。
また、項目や表示の仕方はあくまでサンプルでしかないので自分で使いやすいようにカスタマイズして使ってみてください。

今回はRubyでコンソールからの送信になりますが、最終的にはWebアプリでメールを送信できるようにします。

## 流れ
日報メールプログラムは、次の流れで実行されます。

1. ユーザに「本日の業務」を入力してもらう
  * 「本日の業務」を複数入力してもらってそれを配列に格納します
2. ユーザに「翌日の業務」を入力してもらう
3. ユーザに「所感」を入力してもらう
4. 間違った日報を送信しないように入力内容を確認する
  * 入力内容を出力してユーザにy(yes)/n(no)を入力してもらいます
5. 入力内容からメール本文のHTMLを生成する
  * 綺麗なメールを送るため、メール本文をHTMLにします
6. メールを送信する
  * Gmailを使ってメールを送信します

これらの流れは次の処理を行うプログラムに分割できます。

* 1, 2, 3: ユーザが入力した複数の項目を配列として格納する
* 4: yが入力されたら引き続き処理をして、nが入力されたらプログラムをそこで終了する
* 5: HTML文字列を作成する
* 6: Gmailでメールを送信する

これらの4つの処理をそれぞれ確認し、最後に組み合わせて日報メールプログラムを完成させます。

## 複数項目の入力
ユーザに複数項目を入力させてそれを配列に格納します。
今回の場合で言えば、最終的に次のような配列ができるイメージです。

```ruby
today_tasks = ["店内の清掃", "材料の仕入れ", "厨房での調理"]
```

これを「本日の業務」と「翌日の業務」と「所感」でそれぞれ実行します。

下のプログラムは「本日の業務」を入力させる例です。
何も入力せずEnterすると入力を終了します。
作成して実行してみてください。

```ruby
# 最初に空の配列で用意する
today_tasks = []
puts "本日の業務を入力してください。"
puts "何も入力せずEnterすると入力を終了します。"

# 複数項目入力できるようにloopで繰り返す
# 1回の繰り返しで1項目増える
loop do
  # ユーザの入力を受け付ける
  print "> "
  task = gets.chomp

  if task.empty?
    # もし何も入力がなければ終わりとみなしてloopから抜ける
    break
  else
    # 入力があれば、配列に項目を追加する
    today_tasks << task
  end
end

# pメソッドで確認する
p today_tasks
```

実行すると次のようになるはずです。

```bash
$ ruby input_items.rb
本日の業務を入力してください。
何も入力せずEnterすると入力を終了します。
> 店内の清掃
> 材料の仕入れ
> 厨房での調理
>
["店内の清掃", "材料の仕入れ", "厨房での調理"]
```

## プログラムを途中で中断する
今回作るプログラムは間違った内容の日報メールを送信しないように入力内容を確認して、

* OKなら引き続き処理を行ってメールを送信する
* NGならそこで処理を中断する

ということが必要になります。

途中でプログラムを中断するには、`exit`メソッドを使用します。
例えば次のプログラムを実行すると「さいしょ」しか出力されません。

```ruby
puts "さいしょ"
exit
puts "さいご"
```

これを今回使う様な形にするとこんな感じになります。

```ruby
print "この内容でメールを送信しますか？ [Y/n] "
answer = gets.chomp

if !(answer == "Y" || answer == "y" || answer.empty?)
  puts "処理を中断します。"
  exit
end

puts "メールを送信しました！"
```

毎回「y」と入力するのはめんどくさいので、空EnterでもYesとみなすようにしています。
この`if`文は、「ユーザの入力内容が"Y"か"y"か空、ではない場合」という条件になっています。

`[Y/n]`というのは、デフォルト(空Enter)でYesとみなしますよ、という表現です。

このプログラムを実行すると次のようになります。

```bash
$ ruby exit.rb
この内容でメールを送信しますか？ [Y/n]
メールを送信しました！
$ ruby exit.rb
この内容でメールを送信しますか？ [Y/n] y
メールを送信しました！
$ ruby exit.rb
この内容でメールを送信しますか？ [Y/n] n
処理を中断します。
```

# RubyでHTMLを生成する
# Gmailでメールを送信する

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