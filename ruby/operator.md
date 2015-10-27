# 演算子
## 概要
これまでに`+`や`-`、`=`といった演算子を使いました。
ここでは他にも様々な演算子を紹介します。

## 代入演算子
`=`は代入を行う演算子です。
別の言い方をすると、オブジェクトに変数という名札をつける演算子です。

```ruby
変数名 = オブジェクト
```

## 算術演算子
算術演算(足し算、ひき算など)を行う演算子です。
次の5つがあります。

* `+`: 足し算
* `-`: 引き算
* `*`: 掛け算
* `/`: 割り算
* `%`: 割り算の余り

次のように使います。

```irb
irb(main):001:0> 5 + 2
=> 7
irb(main):002:0> 5 - 2
=> 3
irb(main):003:0> 5 * 2
=> 10
irb(main):004:0> 5 / 2
=> 2
irb(main):005:0> 5 % 2
=> 1
```

`+`や`*`は文字列オブジェクトに使うこともできます。

```irb
irb(main):001:0> "Hello" * 3
=> "HelloHelloHello"
irb(main):002:0> "1" + "0" * 10
=> "10000000000"
```

## 自己代入
代入演算子の`=`と他の演算子を組合せることができます。

例えば次の2つのペアはそれぞれ同じ意味です。
(`a`は変数です)

```ruby
a = a + 1
a += 1

b = b * 3
b *= 3
```

このように、`演算子=`とすると左辺の変数のオブジェクト自身に演算を行い、その結果を再び左辺の変数に代入します。

## 比較演算子
オブジェクトの比較を行い、true/falseを返す演算子です。
主に条件分岐の条件として使います。

以下の比較演算子があります。

<table>
<tr><th>演算子</th><th>例</th><th><code>true</code>を返す条件</th></tr>
<tr>
  <td><code>==</code></td>
  <td><code>a == b</code></td>
  <td><code>a</code>と<code>b</code>が等しい</td>
</tr>
<tr>
  <td><code>!=</code></td>
  <td><code>a != b</code></td>
  <td><code>a</code>と<code>b</code>が等しくない</td>
</tr>
<tr>
  <td><code>&gt;</code></td>
  <td><code>a &gt; b</code></td>
  <td><code>a</code>が<code>b</code>より大きい</td>
</tr>
<tr>
  <td><code>&lt;</code></td>
  <td><code>a &lt; b</code></td>
  <td><code>a</code>が<code>b</code>より小さい</td>
</tr>
<tr>
  <td><code>&gt;=</code></td>
  <td><code>a &gt;= b</code></td>
  <td><code>a</code>が<code>b</code>以上</td>
</tr>
<tr>
  <td><code>&lt;=</code></td>
  <td><code>a &lt;= b</code></td>
  <td><code>a</code>が<code>b</code>以下</td>
</tr>
</table>

次のように実行すると真偽値を返します。

```irb
irb(main):001:0> a = 1
=> 1
irb(main):002:0> b = 1
=> 1
irb(main):003:0> a == b
=> true
irb(main):004:0> if a == b
irb(main):005:1>   puts "等しい！"
irb(main):006:1> end
等しい！
=> nil
irb(main):007:0> if a != b
irb(main):008:1>   puts "等しくない！"
irb(main):009:1> end
=> nil
```

## 論理演算子
論理演算子を使うことで、複数の条件を組合せることができます。

論理演算子には以下のものがあります。

<table>
<tr><th>演算子</th><th>例</th><th>真となる条件</th><th>説明</th></tr>
<tr>
  <td><code>&&</code></td>
  <td><code>A && B</code></td>
  <td><code>A</code>も<code>B</code>も真</td>
  <td>AかつBが真のとき、真となります</td>
</tr>
<tr>
  <td><code>||</code></td>
  <td><code>a || b</code></td>
  <td><code>A</code>または<code>B</code>が真</td>
  <tr>AまたはBのどちらかが真のとき、真となります</td>
</tr>
<tr>
  <td><code>!</code></td>
  <td><code>!A</code></td>
  <td><code>A</code>が偽</td>
  <td>真偽値を反転させます</td>
</tr>
</table>

次のように使います。

```irb
irb(main):001:0> a = 1
=> 1
irb(main):002:0> b = 2
=> 2
irb(main):003:0> if a == 1 && b == 2
irb(main):004:1>   puts "aは1かつbは2"
irb(main):005:1> end
aは1かつbは2
=> nil
irb(main):006:0> if !(a == 1)
irb(main):007:1>   puts "aは1でない"
irb(main):008:1> end
=> nil
```

組合せることで複雑な条件も表現できます。

```
irb(main):001:0> a, b, c = 1, 2, 3
=> [1, 2, 3]
irb(main):002:0> if !(a == 5) && (b == 2 || c == 2)
irb(main):003:1>   puts "aは5でない、かつ、bまたはcが2"
irb(main):004:1> end
aは5でない、かつ、bまたはcが2
=> nil
```

1行目は、次と同じ意味です。

```ruby
a = 1
b = 2
c = 3
```

## 範囲演算子
`..`と`...`は範囲を表す範囲オブジェクトを生成する演算子です。
例えば次の式は1から10までの範囲を表すオブジェクトを返します。

```ruby
1..10
```

次の章で説明する繰り返しや条件式にも使うことができます。
条件式ではよく`include?`メソッドを使います。

```irb
irb(main):001:0> range = 1..10
=> 1..10
irb(main):002:0> range.class
=> Range
irb(main):003:0> range.include?(5)
=> true
irb(main):004:0> range.include?(15)
=> false
```

`..`は末尾のオブジェクトを含み、`...`は含みません。

```irb
irb(main):001:0> range1 = 1..10
=> 1..10
irb(main):002:0> range1.include?(10)
=> true
irb(main):003:0> range2 = 1...10
=> 1...10
irb(main):004:0> range2.include?(10)
=> false
```

数値オブジェクトだけでなく、文字列オブジェクトからも範囲オブジェクトを生成できます。

```irb
irb(main):001:0> "aaa".."zzz"
=> "aaa".."zzz"
irb(main):002:0> ("aaa".."zzz").include?("xyz")
=> true
irb(main):003:0> "あ".."お"
=> "あ".."お"
```

## 練習問題
