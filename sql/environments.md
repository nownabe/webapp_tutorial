# 環境準備
## 概要
手軽に使える関係データベース管理システムであるSQLiteをインストールします。
Windows/MacOS/CentOSの手順をそれぞれ紹介します。

## Windows
### DevKitのインストール
まずDevKitというものをインストールする必要があります。
[ダウンロードページ](http://rubyinstaller.org/downloads)にアクセスしてください。
「DEVELOPMENT KIT」の下の「For use with Ruby 2.0 and above」のうち、32-bitか64-bitの自分のPCにあうものをダウンロードしてください。

### DLLのインストール
SQLiteの[ダウンロードページ](http://www.sqlite.org/download.html)にアクセスして「Precompiled Binaries for Windows」の中からDLLをダウンロードして下さい。
(32-bitか64-bitは自分のPCにあう方を選んでください)



### コマンドラインプログラムのインストール
SQLiteの[ダウンロードページ](http://www.sqlite.org/download.html)にアクセスして「Precompiled Binaries for Windows」の中から「sqlite-shell-win32-x86-****.zip」をダウンロードしてください。




## Mac
Macは最初からSQLiteがインストールされているので、インストール不要です。

`sqlite3`というコマンドを実行するとSQLiteのコンソールに入れます。
抜けるときは`.quit`と入力してエンターキーを押してください。

```bash
$ sqlite3
SQLite version 3.8.4.3 2014-04-03 16:53:12
Enter ".help" for usage hints.
Connected to a transient in-memory database.
Use ".open FILENAME" to reopen on a persistent database.
sqlite> .quit
$ 
```

もし入っていない場合や最新のSQLiteが使いたい場合はHomebrewでインストールできます。

```bash
brew install sqlite
```

Homebrewがインストールできていない場合は[2.1 環境準備](https://nownabe.gitbooks.io/webapp_tutorial/content/ruby/environments.html)をみながらインストールしてください。


## CentOS
yumでインストールできます。
次のコマンドを実行してください。

```bash
sudo yum install -y sqlite sqlite-devel
```

インストールできたら、`sqlite3`コマンドでSQLiteのコンソールに入れます。
抜けるときは`.quit`と入力してエンターキーを押してください。

```bash
$ sqlite3
SQLite version 3.7.17 2013-05-20 00:56:22
Enter ".help" for instructions
Enter SQL statements terminated with a ";"
sqlite> .quit
$ 
```