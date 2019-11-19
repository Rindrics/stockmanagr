# vpaで使う基礎データをパッケージの内部データとして書き出す
# caaなどに変更がない限りは実行する必要はない

# setwd("data-raw")
waa  <- read.csv("waa_tgs.csv", row.names = 1)
caa  <- read.csv("caa_tgs.csv", row.names = 1)
maa  <- read.csv("maa_tgs.csv", row.names = 1)
cpue <- read.csv("cpue_tgs.csv", row.names = 1)
M    <- read.csv("M_tgs.csv", row.names = 1)
dat  <- frasyr::data.handler(caa = caa, waa = waa, maa = maa, M = M, index = cpue)

usethis::use_data(dat, overwrite = TRUE, internal = TRUE)
