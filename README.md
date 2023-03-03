# flutter_shader_sample

FlutterアプリでGLSLを出力するサンプルです。

## 動作環境

- Flutter: v3.7.6
- Dart: v2.19.3

## 使用パッケージ

- flutter_shaders

## Shader言語の参考文献

セルラーノイズ  
https://thebookofshaders.com/12/?lan=jp


## 実装方法

### shaders/worley_noise.frag
GLSLを使用してジェネレーティブアートをコーディングする部分となります。  
pubspec.yamlにて、shaders項目にファイルを追加することを忘れないでください。  
Flutterのスクリーンに描画するには、出力する変数として、大域変数内に以下の内容を定義します。  
<pre>
out vec4 fragColor;
</pre>
上記の変数はmain関数にてベクトルを代入してください。


### lib/widgets/screens/hoge_screen.dart
Flutterの画面にGLSLでコーディングした内容をWidgetsに出力します。  
今一度、パッケージの導入をお忘れなく。  
<pre>
flutter pub add flutter_shaders
</pre>
StreamBuilderを使ってアニメーションを実現させています。  
Stream型で定義されたtimeCounter関数の処理をご確認ください。  
0.1秒間隔で時間が0.1ずつ進んでいることが分かります。  

続いて、ShaderBuilderにて返却されているAnimatedSamplerをご確認ください。  
shader.setFloatが3つ記述されています。これはshaders/worley_noise.fragのuniformで定義された変数と紐づいています。  
よって、StreamBuilderで持続的に変化させているtime変数は、uniform float u_timeとの対応関係にあります。  
残りの対応関係の変数は、出力画像の縦横幅となります。  

以上を以て、Flutterでのシェーダーによるデザインが実装されます。

