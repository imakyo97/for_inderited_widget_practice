# for_inherited_widget_practice

### ブランチ
ChangeNotifier の変更をUIへ反映させる方法別にブランチを分けています。
- listenable_builder :  ChangeNotifier の更新を ListenableBuilder でUIへ反映しているブランチ
- addListener :  ChangeNotifier を addListener することで変更を検知しUIへ反映しているブランチ
- animated_builder :  ChangeNotifier の更新を AnimatedBuilder でUIへ反映しているブランチ

### はじめに
普段 riverpod を使って状態管理を行なっていますが、riverpod を使用しない場合、どのようにコードを書くのか気になり色々調べてみました。  
まず、[「内側」から理解する Flutter 入門](https://zenn.dev/chooyan/books/934f823764db62) を読んでみたところ、[riverpod](https://pub.dev/packages/flutter_riverpod) と [provider](https://pub.dev/packages/provider) が全く違った方法で実装されていることを知りました。  
- riverpod :  Riverpod は InheritedWidgets をゼロから再実装したものである。( [riverpod](https://pub.dev/packages/flutter_riverpod) から引用 )
- provider :  InheritedWidgetをより使いやすく、より再利用しやすくするためのラッパーです。( [provider](https://pub.dev/packages/provider) から引用 )

riverpod と provider は InheritedWidget を使いやすくしたパッケージということで、InheritedWidget を使って実装する場合どのように書くのかやってみました。  
実際に作成したものとしては、共通化したインジケータを各画面で表示するアプリです。  

### InheritedWidget
[InheritedWidget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html) とは情報をツリーの下に効率的に伝達するウィジェットで、コンストラクタなどで数珠繋ぎに値を渡さなくて良くなり、またツリー階層が深くなってもO(1)でのアクセスが可能 

InheritedWidget の[ドキュメントの動画](https://youtu.be/1t-8rBCGBYw)では、データを更新する場合は InheritedWidget を valueNotifier や changeNotifier と組み合わせるとありました。

なので、今回は InheritedWidget と ChangeNotifier を組み合わせて実装をしてみました。

- 参考記事
    - [InheritedWidget を完全に理解する 🎯](https://medium.com/flutter-jp/inherited-widget-37495200d965)  
    - [【 Flutter 】 InheritedWidget って何？](https://blog.flutteruniv.com/flutter-inheritedwidget/#toc4)

### ChangeNotifier
[ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html) とは通知に VoidCallback を使用する変更通知 API を提供する、拡張または混合可能なクラスで ChangeNotifier の変更を addListener などに通知できる

ChangeNotifier の変更を通知する方法はいくつかあり、主に以下の4つの方法があります。
1. [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) で ChangeNotifier が変更された時に呼び出されるクロージャーを登録する方法
2. [AnimatedBuilder](https://api.flutter.dev/flutter/widgets/AnimatedBuilder-class.html) で ChangeNotifier を使用してリビルドをトリガーする方法
3. [ListenableBuilder](https://api.flutter.dev/flutter/widgets/ListenableBuilder-class.html) で ChangeNotifier が変更された時にウィジェットのサブツリーを構築する方法
4. riverpod パッケージや provider パケージの ChangeNotifierProvider を使用する方法
    - riverpod の [ChangeNotifierProvider](https://riverpod.dev/ja/docs/providers/change_notifier_provider)
    - provider の [ChangeNotifierProvider](https://pub.dev/documentation/provider/latest/provider/ChangeNotifierProvider-class.html)

  今回は1~3の方法でコードを書いてみました。

  - 参考記事
    - [Flutter の ChangeNotifier の完全ガイド](https://brewyourtech.com/complete-guide-to-changenotifier-in-flutter/)
