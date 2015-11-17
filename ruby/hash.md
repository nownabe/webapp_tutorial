# ハッシュ
## 概要
配列と並んで重要なデータ構造であるハッシュについて説明します。

## ハッシュとは
ハッシュも配列と同じようにデータの集まりを表現するためのオブジェクトです。

配列ではインデックス番号で各要素を扱いました。

```ruby
array = ["こんにちは", "hello", "你好"]
array[0] #=> "こんにちは"
```

ハッシュでは、インデックス番号の変わりに文字列やシンボルなど任意のオブジェクトを使うことができます。

```ruby
hash = {
  "japanese" => "こんにちは",
  "english" => "hello",
  "chinese" => "你好"
}

hash["japanese"] #=> "こんにちは"
```

ハッシュはこのようにキーとバリューのペアが複数集まったデータ構造です。
この例の場合、キー`"japanese"`のペアは`"こんにちは"`、キー`"english"`のペアは`"hello"`となっています。

## ハッシュオブジェクトの作り方
ハッシュオブジェクトは、次のように作ることができます。

```ruby
{
  キー => バリュー,
  キー => バリュー,
  ...
}
```

`{ }`(中括弧)の中に`キー => バリュー`のペアを`,`(カンマ)で区切って書きます。

キーはどんなオブジェクトでもOKです。
例えば数字を使うと配列と同じように参照できます。

```ruby
kansuji = {
  1 => "一",
  2 => "二",
  3 => "三"
}

kansuji[3] #=> 三
```

特にキーとして使われることが多いのはシンボルです。
シンボルは

```ruby
:シンボル名
```

というふうに、`:`(コロン)の後にシンボルの名前を書きます。
シンボルを使ったハッシュは次のように作成できます。

```ruby
greetings = {
  :japanese => "こんにちは",
  :english => "hello",
  :chinese => "你好"
}

greetings[:chinese] #=> "你好"
```

また、シンボルがキーの場合特別な書き方が用意されています。
上記のハッシュと同じハッシュを次のように作成できます。

```ruby
greetings = {
  japanese: "こんにちは",
  english: "hello",
  chinese: "你好"
}

greetings[:english] #=> "hello"
```

空の配列を作るには、`{}`だけを書けばOKです。

```ruby
empty_hash = {}
```

## ハッシュの基本操作
ハッシュの基本的な次の操作を説明します。

* 参照
* 代入
* キーのリスト
* バリューのリスト
* キーの存在確認
* バリューの存在確認
* キー・バリューペアの削除
* ハッシュの大きさ

### 参照
ハッシュに格納されているオブジェクトを参照するには、`ハッシュ[キー名]`を使います。
すでに何度かでてきましたね。

```ruby
greetings = {
  japanese: "こんにちは",
  english: "hello",
  chinese: "你好"
}

greetings[:english] #=> "hello"
```

存在しないキーを参照した場合は`nil`が返ります。

```ruby
greetings[:french] #=> nil
```

### 代入
キー・バリューペアを新しく作ったり、バリューを変更する場合、`ハッシュ[キー名] = オブジェクト`を使います。

```ruby
greetings #=> {:japanese=>"こんにちは", :english=>"hello", :chinese=>"你好"}

# 新しくキー・バリューペアを作る
greetings[:italian] = "チャオ"
greetings #=> {:japanese=>"こんにちは", :english=>"hello", :chinese=>"你好", :italian=>"チャオ"}

# 既にあるキーのバリューを変更する
greetings[:italian] = "ciao"
greetings #=> {:japanese=>"こんにちは", :english=>"hello", :chinese=>"你好", :italian=>"ciao"}
```

### キーのリスト
`keys`メソッドでハッシュのキーだけを取り出した配列を取得することができます。

```ruby
greetings #=> {:japanese=>"こんにちは", :english=>"hello", :chinese=>"你好", :italian=>"ciao"}

greetings.keys #=> [:japanese, :english, :chinese, :italian]
```

### バリューのリスト
`values`メソッドでハッシュのバリューだけを取り出した配列を取得することができます。

```ruby
greetings #=> {:japanese=>"こんにちは", :english=>"hello", :chinese=>"你好", :italian=>"ciao"}

greetings.values #=> ["こんにちは", "hello", "你好", "ciao"]
```

### キーの存在確認
`key?`メソッドでハッシュにキーが含まれるかどうか調べることができます。

```ruby
greetings #=> {:japanese=>"こんにちは", :english=>"hello", :chinese=>"你好", :italian=>"ciao"}

greetings.key?(:italian) #=> true
greetings.key?(:french)  #=> false
```

### バリューの存在確認
`value?`メソッドでハッシュにバリューが含まれるかどうか調べることができます。

```ruby
greetings #=> {:japanese=>"こんにちは", :english=>"hello", :chinese=>"你好", :italian=>"ciao"}

greetings.value?("こんにちは") #=> true
greetings.value?("こんばんは") #=> false
```

### キー・バリューペアの削除
`delete`メソッドでキー・バリューペアを削除できます。

```ruby
greetings #=> {:japanese=>"こんにちは", :english=>"hello", :chinese=>"你好", :italian=>"ciao"}

greetinds.delete(:italian)
greetings #=> {:japanese=>"こんにちは", :english=>"hello", :chinese=>"你好"}}
```

### ハッシュの大きさ
ハッシュの大きさ(キーがいくつ含まれているか)を調べるには`size`メソッドを使います。

```ruby
greetings #=> {:japanese=>"こんにちは", :english=>"hello", :chinese=>"你好"}

greetings.size #=> 3

greetings.delete(:chinese)
greetings.size #=> 2
```

## ハッシュの繰り返し操作
ハッシュも配列と同じように、各ペアに対して繰り返し処理を行うことができます。

* キー・バリューペアの繰り返し
* キーの繰り返し
* バリューの繰り返し

### キー・バリューペアの繰り返し
配列と同じように`each`メソッドを使います。
ブロック変数にはキーとバリューが代入され、それぞれのペアに対してブロックの処理が実行されます。

```ruby
greetings #=> {:japanese=>"こんにちは", :english=>"hello", :chinese=>"你好"}

greetings.each do |key, value|
  puts "#{key}での挨拶は「#{value}」です。"
end

#=>
# japaneseでの挨拶は「こんにちは」です。
# englishでの挨拶は「hello」です。
# chineseでの挨拶は「你好」です。
```

### キーの繰り返し
キーだけを繰り返し処理するには`each_key`を使います。

```ruby
greetings #=> {:japanese=>"こんにちは", :english=>"hello", :chinese=>"你好"}

# すべてのキーを大文字にして出力する
greetings.each_key { |key| puts key.upcase }

#=>
# JAPANESE
# ENGLISH
# CHINESE
```

### バリューの繰り返し
バリューだけを繰り返し処理するには`each_value`を使います。

```ruby
greetings #=> {:japanese=>"こんにちは", :english=>"hello", :chinese=>"你好"}

greetings.each_value { |value| puts "#{value}はどこの国？" }

#=>
# こんにちははどこの国？
# helloはどこの国？
# 你好はどこの国？
```

## 練習問題
### (1) ハッシュを作ってみる
色々なハッシュを作ってください。

* 世界のあいさつ
* 世界のおやすみ
* など

また、その配列を`p`メソッドで出力してください。
`p`メソッドは`puts`と同じように使います。

```irb
>> p Time.now
2015-11-17 12:01:15 +0900
```

### (2) ペアを追加する
空のハッシュから、(1)と同じハッシュを作成してください。
中身が同じになっているかを`p`メソッドで確認してください。

### (3) あいさつを調べるプログラム
次のプログラムの空欄を埋めて、ユーザの入力した国の挨拶を調べるプログラムを作成してください。

```ruby
greetings = #ハッシュ

print "国名を入力してください > "
country = gets.chomp

puts #答える
```


```bash
$ ruby examples/ruby/2.14/3.rb
国名を入力してください > 日本
日本の挨拶はこんにちはです。
```

### (4) わかりません機能
(3)のプログラムでは、ハッシュに登録されていない国を入力すると意味不明な文が出力されます。
これは、存在しないキーを参照した場合`nil`が返るからです。

```bash
$ ruby examples/ruby/2.14/3.rb
国名を入力してください > フランス
フランスの挨拶はです。
```

登録されていない国が入力された場合、「(国名)は登録されていません。」と出力するようにしてください。

```bash
$ ruby examples/ruby/2.14/4.rb
国名を入力してください > フランス
フランスは登録されていません。
```

### (5) 全部出力
(4)のプログラムに「all」と入力すると全ての国と挨拶を出力する機能を追加してください。

```bash
$ ruby examples/ruby/2.14/5.rb
国名を入力してください > all
日本の挨拶はこんにちはです。
アメリカの挨拶はhelloです。
中国の挨拶は你好です。
```
