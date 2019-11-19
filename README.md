[![Travis build status](https://travis-ci.com/akikirinrin/stockmanagr.svg?branch=master)](https://travis-ci.com/akikirinrin/stockmanagr)
# stockmanagr

# 主な機能
 資源評価業務における実際の運用局面にマッチしたラッパー関数を提供

# 開発者
- 業務の過程において,関数化可能な作業を見つけた魚種担当者
- 表や図の体裁を整えたい管理者

# ユーザー
- 資源評価業務で資料作成する魚種担当者

# dir構成と提供する価値
- R: `stockcalcr`・`stockdocr`の出力をラップする関数
- sysdata.rda: テスト用内部データ
- vignettes: 資源評価業務の計算ルーティンに対応する関数

# 何が形式知化されるか
- 資源評価の全ての計算手順
- 文書と図表の様式

# 課題
`stockcalcr`や`stockdocr`のコンポーネントを小さく作らないと,
本パッケージのテストが書きにくくなる
