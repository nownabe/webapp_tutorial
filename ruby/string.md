# 文字列
## 概要
この章ではRubyの強力な文字列処理について説明します。

## 文字列オブジェクト
すべての文字列オブジェクトは`String`クラスのインスタンスです。
Rubyの文字列は0文字でも1文字でも1万文字でも、`String`クラスのオブジェクトです。

```irb
>> "".class
=> String
>> "a".class
=> String
>> "string".class
=> String
```

## 文字列リテラル
文字列リテラルはかなり多くの種類がありますが、代表的なものをいくつか紹介します。

```irb
# 普通の文字列
"Hello, world!"

# シングルクォーテーションでもOK
'Hello, world!"

# ヒアドキュメント
<<EOS
複数行に渡る
文字列を書くとき
べんり
EOS
```

## シングルクォーテーションとダブルクォーテーションの違い
文字列をシングルクォーテーションで作る場合とダブルクォーテーションで作る場合では違いがあります。

ダブルクォーテーションの場合、式展開ができたり`\`から始まる特殊文字を表現することができます。
シングルクォーテーションではそれらも通常の文字として扱われます。

```irb
>> puts "現在の時刻は#{Time.now}"
現在の時刻は2015-11-09 20:50:41 +0900
=> nil
>> puts '現在の時刻は#{Time.now}'
現在の時刻は#{Time.now}
=> nil

>> puts "改行\nしてみる"
改行
してみる
=> nil
>> puts '改行\nしてみる'
改行\nしてみる
=> nil
```

ダブルクォーテーションの文字列で式展開や特殊文字をそのまま出力したい場合は、バックスラッシュ`\`で__エスケープ__します。

```irb
>> puts "改行\\nしてみる"
改行\nしてみる
=> nil
>> puts "現在の時刻は\#{Time.now}"
現在の時刻は#{Time.now}
=> nil
```

## 文字列の結合
2つの文字列を結合することができます。
結合には、`+`や`concat`メソッドを使います。

`+`は2つの文字列を結合した新しい文字列を返します。

```irb
>> str1 = "Hello, "
=> "Hello, "
>> str2 = "world!"
=> "world!"

# 2つの文字列を+で結合する
>> str3 = str1 + str2
=> "Hello, world!"

# 元の文字列はそのまま
>> str1
=> "Hello, "
>> str2
=> "world!"
```

`concat`メソッドはレシーバの文字列を変更します。

```irb
>> str1 = "Hello, "
=> "Hello, "
>> str2 = "world!"
=> "world!"

# 2つの文字列をconcatで結合する
>> str1.concat(str2)
=> "Hello, world!"

# レシーバに追加される
>> str1
=> "Hello, world!"
>> str2
=> "world!"
```

## 文字列の繰り返し
文字列を行ごとや文字ごとに処理することができます。

1文字ごとに処理する場合は`each_char`メソッド[^1]を使います。

```irb
>> "Hello, world!".each_char do |char|
?>   puts "Character: #{char}"
>> end
Character: H
Character: e
Character: l
Character: l
Character: o
Character: ,
Character:
Character: w
Character: o
Character: r
Character: l
Character: d
Character: !
=> "Hello, world!"
```

1行ごと(改行文字ごと)に処理する場合は`each_line`メソッドを使います。

```irb
>> text = <<EOF
1行毎に処理するには
each_lineメソッドを使ってください。
テキストファイルを処理する場合など
有効です。
EOF
=> "1行毎に処理するには\neach_lineメソッドを使ってください。\nテキストファイルを処理する場合など\n有効です。\n"

>> text.each_line do |line|
?>   puts "Line: #{line}"
>> end
Line: 1行毎に処理するには
Line: each_lineメソッドを使ってください。
Line: テキストファイルを処理する場合など
Line: 有効です。
=> "1行毎に処理するには\neach_lineメソッドを使ってください。\nテキストファイルを処理する場合など\n有効です。\n"
```

また、`[ ]`で文字の位置や範囲を指定することでそこの部分文字列だけを抜き出すことができます。

```irb
>> str = "Hello, world!"
=> "Hello, world!"

# [位置]でその位置の文字を抜き出せます
>> str[0]
=> "H"
>> str[1]
=> "e"

# マイナスをつけると後ろから数えた位置になります
>> str[-1]
=> "!"
>> str[-2]
=> "d"

# 範囲外ならnilとなります
>> str[100]
=> nil

# 範囲も指定できます。
>> str[0...5]
=> "Hello"
```

文字列の長さは`length`メソッドで調べられるので、次のようにして2文字ずつ処理するといったことも可能です。

```irb
str = "Hello, world!"

# str.lengthは13なので(0...13).eachとなる
(0...str.length).each do |i|
  # 1回目はstr[0..1]、2回目はstr[1..2]と2文字ずつ処理される
  puts str[i..(i+1)]
end
```

これを実行すると次のようになります。

```bash
$ ruby each_2chars.rb
He
el
ll
lo
o,
,
 w
wo
or
rl
ld
d!
!
=> 0...13
```

文字列の位置は最初が0から始まります。なので、最後の文字の位置は`str.length - 1`となります。

```irb
>> str[0]
=> "H"
>> str[str.length - 1]
=> "!"
```

## 文字列の置換
`sub`や`gsub`といったメソッドを使うと、文字列の一部を置き換えることができます。

```irb
>> str = "Hello, world!"
=> "Hello, world!"

>> str.sub("Hello", "こんにちは")
=> "こんにちは, world!"
```

`sub`も`gsub`も、次のようにして使います。

```
文字列オブジェクト.sub("置き換える前の部分文字列", "置き換えた後の文字列")
文字列オブジェクト.gsub("置き換える前の部分文字列", "置き換えた後の文字列")
```

`sub`は最初に見つかった部分文字列しか置換しません。`gsub`はみつかったすべての部分文字列を置換します。

```irb
>> str.sub("l", "L")
=> "HeLlo, world!"
>> str.gsub("l", "L")
=> "HeLLo, worLd!"
```

## 部分文字列の検索
`include?`メソッドを使うと文字列の中にある文字列が含まれているかどうかを調べることができます。

```irb
>> str = "Hello, world!"
=> "Hello, world!"

# true/falseを返す
>> str.include?("Hello")
=> true
>> str.include?("こんにちは")
=> false
```

## 練習問題
### (1) 文字ごとの処理1
ユーザの入力した文字列のそれぞれの文字を2重にするプログラムを作成してください。

```bash
$ ruby double_char.rb
何か入力してください > Hello, world!
HHeelllloo,,  wwoorrlldd!!
```

### (2) 文字ごとの処理2
ユーザの入力した文字列のそれぞれの文字をイコール`=`でつなぐプログラムを作成してください。

```bash
$ ruby join_string.rb
何か入力してください > Hello, world!
H-e-l-l-o-,- -w-o-r-l-d-!
```

### (3) 置換
ユーザの入力した文字列に`Hello`か`hello`が含まれていたら、すべての`hello`と`Hello`を`こんにちは`に置換するプログラムを作成してください。

```bash
$ ruby sub_hello.rb
何か入力してください > Hello, hello, hello, how low?
こんにちは, こんにちは, こんにちは, how low?
```


[^1]: Each Characterの略です