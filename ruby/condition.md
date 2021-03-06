# 条件分岐
## 概要
プログラムでは、「ある条件のときにだけ処理Aを行う。そうでない場合には処理Bを行う」のように条件によって処理を変えることがよくあります。
そのような条件による処理の分岐について説明します。

## 例
コマンドライン引数[^1]で与えられた値段から消費税込みの値段を計算するプログラムを作ってみましょう。

```ruby
price = ARGV[0].to_i

puts "税抜価格は#{price}円です。"
puts "税込価格は#{(price * 1.08).to_i}円です。"
```

このプログラムは上手く消費税を計算することができます。
しかし、引数に値段を書き忘れた場合やマイナスの値を渡した場合も正しく計算したかのような結果を出力します。

```bash
$ ruby tax_cond.rb 500
税抜価格は500円です。
税込価格は540円です。
$ ruby tax_cond.rb
税抜価格は0円です。
税込価格は0円です。
$ ruby tax_cond.rb -500
税抜価格は-500円です。
税込価格は-540円です。
```

このプログラムを利用するユーザーのことを考えると、次のような処理を入れた方が親切といえます。

* コマンドライン引数がない場合、「コマンドライン引数に値段を入力してください」というメッセージを出力する
* 渡された値段が0円以下の場合、「値段は正の整数で入力してください」というメッセージを出力する

このような、条件によって処理を変えることを条件分岐といいます。

## if文による条件分岐
if文は最も代表的な条件判断文です。
次のように書きます。

```ruby
if 条件
  処理
end
```

これで、条件を満たす場合のみ中に書いた処理を実行します。
プログラムの流れを図にするとこのようになります[^2]。

![](if.png)

次のプログラムの場合、「`x`が`10`より大きい場合、`puts`を実行する」というプログラムになります。

```ruby
if x > 10
  puts "xは10より大きいです。"
end
```

## 真偽値
Rubyで「条件を満たす」とはどういう意味なのかを説明します。

数学やプログラミングの世界では、条件を満たすことを__真__、満たさないことを__偽__といいます。
つまり、上で説明したif文の場合は「条件が真であれば処理を実行する」といえます。

Rubyでは、条件式が`false`か`nil`以外の場合はすべて__真__として扱います。

* 真: `false`と`nil`以外
* 偽: `false`と`nil`

`false`や`nil`についてはこれから説明します。

## true/false
`false`はRubyが偽として扱うオブジェクトのひとつです。
また、それと対をなすオブジェクトとして`true`があります。
それぞれ真偽値を表現するための特別なオブジェクトです。

`true`と`false`は、何かを比較した返り値や条件を調べるメソッドの返り値として利用されています。

```irb
# 整数を比較する
irb(main):001:0> 10 > 5
=> true
irb(main):002:0> 10 < 5
=> false

# 文字列が空かどうか調べるempty?メソッド
irb(main):003:0> "文字列".empty?
=> false
irb(main):004:0> "".empty?
=> true

# レシーバのオブジェクトのクラスを調べるis_a?メソッド
irb(main):005:0> 10.is_a?(Fixnum)
=> true
irb(main):006:0> 10.is_a?(String)
=> false
```

これらの結果をそのままif文の条件として使うことができます。

```ruby
if 10 > 5
  # 10 > 5 はtrue、つまり真なので実行される
  puts "真です"
end

if 10 < 5
  # 10 < 5 はfalse、つまり偽なので実行されない
  puts "偽です"
end

if "文字列".empty?
  # "文字列".empty? はfalse、つまり偽なので実行されない
  puts "偽です"
end

if "".empty?
  # "".empty? はtrue、つまり真なので実行される
  puts "真です"
end
```

## nil
`nil`は何もないことを示す特別なオブジェクトです。
例えばコマンドライン引数に何も書かなかった状態だと、`ARGV[0]`は`nil`になっています。

```irb
irb(main):001:0> ARGV[0]
=> nil
```

## if/elsif/else
改めて条件分岐のif文を紹介します。
if文では`else`を使えば条件が__偽__のときの処理も書くことができます。
また、`elsif`を使えば2つ目の条件を書くこともできます。

```ruby
if 条件1
  処理1
elsif 条件2
  処理2
elsif 条件3
  処理3
else
  処理4
end
```

![](ifelse.png)

一番初めの例をif-elseで書くとこうなります。

```ruby
if ARGV[0].nil?
  puts "コマンドライン引数に値段を入力してください"
elsif ARGV[0].to_i <= 0
  puts "値段は正の整数で入力してください"
else
  price = ARGV[0].to_i
  puts "税抜価格は#{price}円です。"
  puts "税込価格は#{(price * 1.08).to_i}円です。"
end
```

## case
条件が多い場合、case文を使うとelsifで条件をすべて書くより簡単に書くことができます。
case文は次のように書きます。

```ruby
case 比較対象のオブジェクト
when 値1
  処理1
when 値2
  処理2
when 値3
  処理3
else
  処理4
end
```

`case`の後ろに比較対象のオブジェクトを書き、`when`の後ろに条件となる値を書きます。
比較対象のオブジェクトと`when`の値が等しければ[^3]そこの処理を実行します。
どの値とも一致しなかった場合は`else`文が実行されます。
`else`は省略することもできます。

![](case.png)

例えば入力されたプログラミング言語のHello, world!を調べるプログラムはこんな感じです。

```ruby
language = ARGV[0]

puts "#{language}のHello, world!は:"
puts "========"

case language
when "Ruby"
  puts "puts \"Hello, world!\""
when "C"
  puts "#include <stdio.h>"
  puts "int main(void) {"
  puts "  printf(\"Hello, world!\");"
  puts "}"
when "Java"
  puts "class Hello {"
  puts "  public static void main(String[] args) {"
  puts "    System.out.println(\"Hello, world!\");"
  puts "  }"
  puts "}"
else
  puts "わかりません><"
end

puts "========"
```

文字列中にダブルクオーテーションをいれるときは、バックスラッシュをつけて`\"`と書きます。
バックスラッシュがないとダブルクオーテーションが文字列の終わりとして扱われてしまうからです。
「2.13. 文字列」でまた説明します。

`when`には複数の値を書くこともできます。次の例は入力されたものが寿司ネタか調べるプログラムです。

```ruby
neta = ARGV[0]

case neta
when "マグロ", "イカ", "ウニ"
  puts "#{neta}は最高の寿司になります!!"
when "卵焼き"
  puts "子供も大人もウマイ!"
when "ガリ"
  puts "ガリは生姜!"
else
  puts "ごめんなさい。わかりません><"
end
```

## 練習問題
### (1) 消費税プログラム
if/elsif/else文の例として示した消費税を計算するプログラムを、例と同じように作成して実行してください。
その際、入力した値によって動作が変わることを確かめてください。

### (2) Hello, world!プログラム
case文の例として示したHello, world!を調べるプログラムを、例と同じように作成して実行してください。
その際、入力した値によって動作が変わることを確かめてください。

### (3) Go言語のHello, world!
(2)のHello, worldプログラムにGo言語のHello, world!を追加してください。

GoのHello, world!は次のように書きます。

```go
package main
import "fmt"
func main() {
	fmt.Println("Hello, world!")
}
```

### (4) 寿司ネタプログラム
case文の例として示した寿司ネタかどうか調べるプログラムを、例と同じように作成して実行してください。
その際、入力した値によって動作が変わることを確かめてください。

### (5) 寿司ネタ++
(4)で作成した寿司ネタプログラムに他のネタや`when`を増やしてください。

[^1]: 演習問題(2)を参考にしてください。
[^2]: このような図をフローチャートといいます。
[^3]: `when`では`===`というメソッドを使って比較しています。ゆるく等しいかをチェックできるメソッドです。