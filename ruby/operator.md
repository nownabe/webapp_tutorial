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
オブジェクトの比較を行い、真偽値を返す演算子です。
主に条件分岐の条件として使います。

以下の比較演算子があります。

<table>
<tr><th>演算子</th><th>例</th><th>真を返す条件</th></tr>
<tr><td>`>`</td><td>`a > b`</td><td>`a`が`b`より大きい</td></tr>
</table>

## 論理演算子
## 範囲演算子