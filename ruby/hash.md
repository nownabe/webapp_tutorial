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