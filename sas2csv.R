rm(list=ls())

#################################################
## SAS 데이터를 csv로 내보내기
## - 주의! 해당 폴더의 sas 파일을 모두 csv 변경
#################################################


# -----------------------------------------
# 데이터 파일 경로 지정
# -----------------------------------------

# \대신 /로 변경 필요

path  = "C:/Users/mintb/Desktop/koGES/data"  


# SAS 파일 읽기 위한 패키지 로드
# install.packages("haven")
library(haven)


# 폴더 내 sas 파일명 추출
path = paste0(file.path(path), "/")
files = list.files(path)
files = files[which(substr(files, nchar(files)-7, nchar(files)) == "sas7bdat")]

# sas 파일을 읽어와서 csv 파일로 변경
for(i in files){
	x = as.data.frame(read_sas(paste0(path, i)))
	write.csv(x, paste0(path, substr(i, 1, nchar(i)-8), "csv"), row.names=F)
}

