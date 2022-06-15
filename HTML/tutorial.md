# HTML
- HTMLは`Hyper Text Markup Language`の略
- HTMLは、Webページを作成するための標準のマークアップ言語

## HTML属性
- 全てのHTML要素は属性を持つことができる
- 属性は、要素に関する追加情報を提供する
- 属性は常に開始タグで指定される

## HTML見出し
- HTMLの見出しは、`<h1>〜<h6>`タグで定義される
- HTML見出しは見出しのみに使用する。テキストを大きくしたり太字にしたりするために見出しを使用しない！

## 色の値
- HTMLでは、RGB値、HEX値、HSL値、RGBA値、及びHSLA値を使用して色を指定することができる
### RGBカラー値
- rgb（赤、青、緑）
- 色のパラメーターは0〜255の値で色の強度を定義する
- 256 × 256 × 256 = 16777216の可能な色があることを意味する
### RGBAカラー値
- rgba（赤、緑、青、アルファ）
- RGBAカラー値は、アルファチャネルを使用したRGBカラー値の拡張。
- これは、色の不透明度を指定
### HEXカラー値
- HTMLでは16進数を使用して色を指定する
- rr（赤）、gg（緑）、及びbb（青）は、00からffまでの16進数である。
### HSLカラー値
- HSLは、色相、彩度、明度の略
- 彩度、明度はパーセンテージ値
### HSLAカラー値
HSLA色値は、色の不透明度を指定するアルファチャネルを使用したHSL色値の拡張。

## HTMLリンク ターゲット属性
- デフォルトでは、リンクされたページは現在のブラウザウィンドウに表示されます。これを変更するには、リンクの別のターゲットを指定する必要がある
- `_blank`新しいウィンドウまたはタブでドキュメントを開きます

## メールアドレスへのリンク
- `mailto:`属性内で使用`href`して、ユーザーの電子メールプログラムを開くリンクを作成

## HTMLでブックマークを作成
- ブックマークは、Webページが非常に長い場合に役立ちます。
- ブックマークを作成するには-最初にブックマークを作成してから、それにリンクを追加します。

## HTML画像のクリック可能な領域の定義
- HTML`<map>`要素を使用して画像マップを定義します
- HTML`<area>`要素を使用して、画像マップのクリック可能な領域を定義します
- 要素のHTMLusemap属性を 使用`<img>`して、画像マップをポイントします

## ファビコンの追加
- `<head>`の中の`<link>`にファビコンの画像を指定。

## HTMLブロックとインライン要素
### ブロックレベルの要素
- ブロックレベルの要素は常に新しい行から始まる。
- ブロックレベルの要素は、常に使用可能な全幅を占める（可能な限り左右に伸びる）。
- ブロックレベルの要素には上マージンと下マージンがありますが、インライン要素にはない
- `<div>`要素はブロックレベルの要素であり、他のHTML要素のコンテナとしてよく使用される。
### インライン要素
- インライン要素は新しい行から始まらない
- インライン要素は、必要なだけの幅を取る
- `<span>`はインライン要素であり、テキストの一部またはドキュメントの一部をマークアップするためによく使用される。
- インライン要素にブロックレベルの要素を含めることはできない