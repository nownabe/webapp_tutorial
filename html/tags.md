さまざまなHTMLタグ
===================

## 概要
HTMLの基本的なタグを紹介します。
body要素の中で使用する(ブラウザで表示される)タグに限って紹介します。

全てのタグは紹介しませんので必要に応じて[リファレンスサイト](http://www.htmq.com/html5/index.shtml)などを参照してください。

HTMLはあくまでも文書の構造を表現する言語なので文書の構造に注目して読んでください。
デザインはCSSで行います。

## h1, h2, h3, h4, h5, h6要素
文書の章や節のタイトル・見出しを定義する要素です。

数字が小さいほど階層が上であることを示します。
次のようなイメージです。

```html
<h1>自己紹介</h1>
  <h2>趣味</h2>
    <h3>読書</h3>
      <h4>ミステリー</h4>
        <p>犯人を考えるのが楽しい</p>
        
      <h4>恋愛小説</h4>
        <p>どきどきする</p>
    <h3>プログラミング</h3>
      <h4>Ruby</h4>
        <p>書いてて楽しい</p>
      
      <h4>JavaScript</h4>
        <p>動きがあって楽しい</p>

  <h2>特技</h2>
    <h3>...</h3>
```

## p要素
段落(paragraph)を表す要素です。

```html
<p>吾輩は猫である。名前はまだ無い。<p>
<p>
  どこで生れたかとんと見当がつかぬ。
  何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。
  吾輩はここで始めて人間というものを見た。
  ...
</p>
```

## section要素
文書の塊、セクションを定義します。

```html
<h1>自己紹介</h1>

<section>
  <h2>趣味</h2>
    
  <section>
    <h3>読書</h3>
    
    <section>
      <h4>ミステリー</h4>
      <p>犯人を考えるのが楽しい</p>
    </section>
      
    <section>
      <h4>恋愛小説</h4>
      <p>どきどきする</p>
    </section>
  </section>
  
  <section>
    <h3>プログラミング</h3>
    
    <section>
      <h4>Ruby</h4>
      <p>書いてて楽しい</p>
    </section>
    
    <section>
      <h4>JavaScript</h4>
      <p>動きがあって楽しい</p>
    </section>
  </section>
</section>
  
<section>
  <h2>特技</h2>
  ...
</section>
```

## header要素
文書全体やセクションのヘッダを表します。
タイトルや目次などをいれます。

```html
<body>
  <header>
    <h1>自己紹介</h1>
  </header>
  <section>
    <header>
      <h2>趣味</h2>
      ...
    </header>
  </section>
</body>
```

## footer要素
文書全体やセクションのフッタを表します。
著者の連絡先や関連ページへのリンクをいれます。

```html
<body>
  ...
  
  <footer>
    <p>Copyright (c) nownabe<p>
    <p>連絡先: @nownabe xxx-yyyy-zzzz</p>
  </footer>
</body>
```

## a要素
リンクをはります。
ブラウザで`a`要素の内容をクリックすると違うページに移動できるようになります。

リンク先は`href`属性で指定します。

```html
<a href="./profile.html">自己紹介</a>
```

`.`は相対URLという書き方です。
相対URLではリンク先のURLをリンク元のファイルからの相対的なパスで指定します。
対照的に絶対的なURLで表す絶対URLというものもあります。

絶対URLでは次のように普通にURLを書きます。

```html
<a href="https://www.google.co.jp">Google</a>
```

相対パスではそのファイルからみて同じフォルダ階層を「`.`」、一つ上の階層を「`..`」で表し、フォルダの区切りを「`/`」で表します。

```
html
├── index.html
├── profile.html
└── programings
    ├── javascript.html
    └── ruby.html
```

例えば上のようなフォルダ構成の場合、`profile.html`から`index.html`にリンクをはる場合は、

```html
<a href="./index.html">戻る</a>
```

とします。`javascript.html`にリンクをはるには、

```html
<a href="./programings/javascript.html">JavaScript</a>
```

とします。`javascript.html`から`profile.html`へリンクをはるにはひとつ上の階層になるので

```html
<a href="../profile.html">自己紹介へもどる</a>
```

とします。`javascript.html`から`ruby.html`は同じ階層なので

```html
<a href="./ruby.html">Ruby</a>
```

とします。

## ol, ul, li要素
箇条書きを表現する要素です。

`ol`要素は順序付きリスト(ordered list)、`ul`要素は順序なしリスト(unordered list)です。
`li`要素はリストのひとつひとつの項目(list item)です。

次のようにして使います。

順序ありリスト:

```html
<ol>
  <li>HTML5/CSS3</li>
  <li>SQL</li>
  <li>Ruby</li>
  <li>Sinatra</li>
</ol>
```

表示例:

> 1. HTML5/CSS3
> 2. SQL
> 3. Ruby
> 4. Sinatra

順序なしリスト:

```html
<ul>
  <li>JavaScript</li>
  <li>Ruby</li>
</ul>
```

表示例:

> * JavaScript
> * Ruby

## b, i, em, strong要素
テキストの意味を表す要素です。

* `b`要素: 文書のキーワードや製品名など他と区別したいテキストを表す
* `i`要素: 技術単語や外来語など他と区別したいテキストを表す
* `em`要素: 強調したいテキストを表す
* `strong`要素: 重要なテキストを表す

> ```html
> <p>
>   どの実装が生き残るか、さらにもう一段階<i>パラダイムシフト</i>が
>   あるのか？っていう懸念はありますが、僕は
>   <em>
>     間違いなく<strong>仮想DOM</strong>が次世代の<b>フロントエンド環境</b>のスタンダードになる
>   </em>
>   と思っています。
> <p>
> ```

## img要素
文書に画像を埋め込むための要素です。`src`属性で画像ファイルの絶対URLか相対URLを指定します。

```html
<img src="./mypicture.jpg">
<img src="http://k.yimg.jp/images/top/sp2/cmn/logo-ns-131205.png">
```


## table要素
表を定義する要素です。
`table`要素で表全体を囲みます。
`tr`要素で表の行を表します。
`td`要素で表の各セルを表します。

見出しには`th`を使います。

```html
<table>
  <tr>
    <th>国名</th>
    <th>首都</ht>
    <th>国旗</th>
  </tr>
  <tr>
    <td>日本</td>
    <td>東京都</td>
    <td><img src="http://tamenal.com/wp-content/uploads/2015/07/356ca5e02c1fe8688d29743aaa46a317.jpeg" width="141" height="89"></td>
  </tr>
  <tr>
    <td>アメリカ合衆国</td>
    <td>ワシントンD.C.</td>
    <td><img src="http://bookclub.japantimes.co.jp/userimg/image/No_41-Q2-2.jpg" width="122" height="88"></td>
  </tr>
</table>
```

<table>
  <tr>
    <th>国</th>
    <th>首都</ht>
    <th>国旗</th>
  </tr>
  <tr>
    <td>日本</td>
    <td>東京都</td>
    <td><img src="http://tamenal.com/wp-content/uploads/2015/07/356ca5e02c1fe8688d29743aaa46a317.jpeg" width="141" height="89"></td>
  </tr>
  <tr>
    <td>アメリカ合衆国</td>
    <td>ワシントンD.C.</td>
    <td><img src="http://bookclub.japantimes.co.jp/userimg/image/No_41-Q2-2.jpg" width="122" height="88"></td>
  </tr>
</table>