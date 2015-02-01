# vagrant-orezeni

これは、「[税金はどこへ行った？](http://spending.jp/)」のためのVagrant開発環境です。

「[税金はどこへ行った？](http://spending.jp/)」は、GitHubを使用すればサーバーを用意すること無く無料で立ち上げることができますが、このVagrant環境を利用すると、ローカルで確認しながら作業を行うことができるようになります。

## Getting Started

### VirtualBoxをインストール

以下のURLからVirtualBoxの最新版を入手してインストールしてください。

[https://www.virtualbox.org/](https://www.virtualbox.org/)

### Vagrantをインストール

VirtualBoxのインストールが完了したらVagrantをインストールしてください。

[https://www.vagrantup.com/](https://www.vagrantup.com/)

### 「俺のゼニはどこ行った for 横浜」のGitHubプロジェクトをフォーク

「[俺のゼニはどこ行った for 横浜](https://github.com/spendingjp/orezeni.github.com)」のプロジェクトをフォークしてください。

デフォルトではこのプロジェクトのリポジトリのURLが指定されていますので、とりあえずこのまま立ち上げていただいても構いません。

### 任意のディレクトリにvagrant-orezeniをダウンロード

以下のURLから最新版を入手してください。

[https://github.com/codeforwakayama/vagrant-orezeni/releases](https://github.com/codeforwakayama/vagrant-orezeni/releases)

### VagrantfileにフォークしたプロジェクトのリポジトリのURLを記述

本プロジェクトに含まれているVagrantfileをテキストエディター等で開いて、リポジトリのURLを先ほどフォークしたプロジェクトのURLに修正してください。

```
    chef.json = {
      :orezeni => {
        :repository => 'https://github.com/orezeni/orezeni.github.com.git'
      }
    }
```

### 起動

```
$ cd vagrant-orezeni
$ vagrant up
```

### ブラウザでアクセス

以下のURLにアクセスしてください。

[192.168.111.222](192.168.111.222)

## カスタマイズ方法

データのカスタマイズ方法は[「税金はどこへ行った？」の公式サイト](http://spending.jp/)を御覧ください。

データは`www/orezeni`ディレクトリ以下にあります。

## カスタマイズ内容の反映方法

「[税金はどこへ行った？](http://spending.jp/)」は、jekyllで作られていますので、ファイルを修正後にビルドする必要があります。

### Vagrantの仮想マシンにログイン

まず仮想マシンにログインしてください。

```
$ vagrant ssh
```

### jekyllのビルド

SSHでログインしたら、「[税金はどこへ行った？](http://spending.jp/)」がインストールされているディレクトリに移動してからビルド用のコマンドを実行してください。

```
$ cd /var/www/orezeni
$ bundle exec rake build
```

ファイルの修正を監視して自動的にビルドしたい場合は以下のコマンドを実行してください。

```
$ cd /var/www/orezeni
$ bundle exec rake auto
```
