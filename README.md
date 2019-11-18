[![Travis build status](https://travis-ci.com/akikirinrin/stockmanagr.svg?branch=master)](https://travis-ci.com/akikirinrin/stockmanagr)
# MTW
Map The Wrapper

# 機能
資源評価担当者の以下の作業を補助する関数を提供する
- 計算
- 結果の評価
- 報告書執筆
- 作図・作表

# 開発者
- 業務の過程において,関数化可能な作業を見つけた魚種担当者
- 表や図の体裁を整えたい管理者

# ユーザー
計算・評価・執筆を繰り返す評価担当者

# dir構成と提供する価値
- R: `stockcalcr`・`stockdocr`の出力をラップする関数,テスト用関数
- data: なし。ここを曖昧にすると方針がブレてくるので注意
- sysdata.rda: テスト用内部データ
- vignettes: 業務において必要な計算フローと,それを実行する関数の説明
- Issue: 関数の追加・抽象化案およびバグ報告

# 何が形式知化されるか
- 資源評価の全ての計算手順
- 感度分析
- 再生産関係などの網羅的検討
- 図表の様式

# 課題
`stockcalcr`や`stockdocr`のコンポーネントを小さく作らないと,
本パッケージのテストが書きにくくなる
