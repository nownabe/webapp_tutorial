Slimで楽をしよう
=====================

## 概要
これまでHTMLやCSSを書いてきて、タグ書くのに毎回`<`と`>`をつけないといけないのがめんどくさいと思った方もいるんじゃないでしょうか？
そんな方は[プログラマーに向いています！](http://qiita.com/ggggnonaka/items/7ea0e6c545bea9ce22ee)

この章ではHTML/CSSをもっと楽に書く方法を軽く紹介します。

* Slimとは
* Rubyインストール
* Slimの使い方

## Slimとは
Slimとはテンプレートエンジンと呼ばれるもののひとつであり、テンプレート言語の一種です。
テンプレートエンジンとはプログラムでHTMLを生成するための仕組みです。
Webアプリケーションではよく利用されています。

その中でもSlimはHTMLの本質的な部分のみを記述すればいいようにできています。

例をみた方がはやいと思います。
次のHTMLを見てください。

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>自己紹介</title>
  </head>
  <body>
    <h1>自己紹介</h1>

    <section>
      <h2>なまえ</h2>
      <p>なまえはほげほげです。</p>
    </section>

    <section>
      <h2>しゅみ</h2>
      <p>しゅみはもげもげです。</p>
    </section>

    <section>
      <h2>とくぎ</h2>
      <p>とくぎはふがふがです。</p>
    </section>
  </body>
</html>
```

これをSlimで書くと次のようになります。

```slim
doctype html
html
  head
    meta charset="utf-8"
    title 自己紹介
  body
    h1 自己紹介
    
    section
      h2 なまえ
      p なまえはほげほげです。
    
    section
      h2 しゅみ
      p しゅみはもげもげです。
    
    section
      h2 とくぎ
      p とくぎはふがふがです。
```

いかがでしょうか。だいぶすっきりしました。
`<`と`>`がなくなっていたり、閉じタグを使わずインデントで木構造を表現してたりします。

HTMLの無駄な部分を極限まで削った感じになっています。

## Rubyインストール

## Slimの使い方
### Slimインストール
### 基本的な書き方
詳しい書き方は他の記事を参照してください。

* [速習テンプレートSlim(HTML作成編)](http://qiita.com/yterajima/items/53fd0387279510ff082a)
* [Slim](http://slim-lang.com/)

### HTMLに変換する
