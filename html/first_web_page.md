はじめてのWebページ
===================

## 概要
HTMLファイルを作成してブラウザで表示させてみます。

* `index.html`というHTMLファイルを作成する
* `profile.html`を作成する
* `index.html`から`profile.html`へリンクを作成する
* `profile.html`から`index.html`へリンクを作成する

## index.htmlを作る
まずは`index.html`を作成しましょう。
`index.html`はWebサイト(Webページの集合)のトップページとなるHTMLファイルです。

では早速テキストエディタを開いてください。
テキストエディタに次の内容を入力してください。

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>はじめてのWebページ</title>
  </head>
  <body>
    <h1>はじめてのWebページ</h1>
    <p>はじめてのWebページです！わーい</p>
  </body>
</html>
```

これはWebページを構成するための必要最低限のHTMLです。
入力できたら、勉強会用のフォルダに`index.html`という名前で保存します。

Atomの場合はFileメニューの「Save as」をクリックしてください。

![](スクリーンショット_2015-08-31_16_03_17.png)

保存ダイアログが表示されるので、`~/lestudy/html`に`index.html`という名前で保存してください。

Windowsならライブラリのドキュメントに`lestudy`フォルダがあります。

Macの場合は下の図の通り▼ボタンをクリックしてください。

![](スクリーンショット_2015-08-31_16_12_38.png)

保存ダイアログが広がったら、キーボードで「Command + Shift + H」キーを押してください。同時押しです。
そうするとホームディレクトリが表示されるので`lestudy`フォルダが見つかります。

![](スクリーンショット_2015-08-31_16_13_40.png)

`lestudy/html`フォルダを選択したら「Save as」欄に`index.html`と入力して【Save】ボタンをクリックしてください。

![](スクリーンショット_2015-08-31_16_21_15.png)

これでHTMLファイルが保存できました。
ブラウザで表示してみましょう。

Finderで`lestudy/html`フォルダをみると、中に`index.html`ができています。

![](スクリーンショット_2015-08-31_16_26_11.png)

これをダブルクリックしてください。うまくいけば、次のようにWebページが表示されるはずです！

![](スクリーンショット_2015-08-31_16_28_50.png)

## profile.htmlを作る
次は`profile.html`を作成しましょう。
AtomのFileメニューから「New File」をクリックして、新しくファイルを作成します。

次のHTMLを適当に編集して`index.html`と同じように勉強会用フォルダ(`lestudy/html`)に`profile.html`として保存してください。

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

保存できたら`index.html`と同じように`profile.html`をダブルクリックして開いてみてください。

## リンクさせる
最後に`index.html`と`profile.html`を互いにリンクさせてみましょう。
まずは`index.html`から`profile.html`へのリンクを作成します。

先ほど作成した`index.html`を開いてください。
Atomだと左のツリーメニューや上部のタブから`index.html`をクリックすればOKです。

![](スクリーンショット_2015-08-31_17_00_28.png)

タブなどで`index.html`が表示されていない場合はFileメニューの「Open」から`index.html`を開いてください。

開いた`index.html`を次のように編集してください。
`<section>〜</section>`が追加されています。

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>はじめてのWebページ</title>
  </head>
  <body>
    <h1>はじめてのWebページ</h1>
    <p>はじめてのWebページです！わーい</p>
    
    <section>
      <h2>メニュー</h2>
      <ul>
        <li><a href="./profile.html">自己紹介</a></li>
      </ul>
    </section>
  </body>
</html>
```

編集が終わったら保存してください。既に作成されているファイルを編集した場合は、ファイルメニューの「Save as」ではなく「Save」をクリックします。

保存できたらもう一度ブラウザで`index.html`を開いてください。リンクが追加されていると思います。このリンクをクリックして`profile.html`が表示されることを確認してください。これがWebページを結びつけるハイパーリンクという機能です。

次に`profile.html`から`index.html`に戻れるようにリンクを作成します。
`profile.html`をエディタで開いて次のように編集してください。
`<footer>〜</footer>`が追加されています。

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
    
    <footer>
      <p><a href="./index.html">戻る</a></p>
    </footer>
  </body>
</html>
```

同じようにブラウザで表示させてみてください。
`index.html`と`profile.html`を行き来できるようになっていれば成功です！

WebサイトはこのようにWebページを互いにリンクさせて構築していきます。
