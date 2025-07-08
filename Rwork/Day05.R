setwd(dir = "C:/pycode/Rwork/Data")
rm(list=ls())

library(foreign)             # SPSS 파일 로드 
library(dplyr)               # 전처리 
library(ggplot2)             # 시각화 
library(readxl)              # 엑셀 파일 불러오기

raw_welfare <- read.spss(file="Koweps_hpc10_2015_beta1.sav", to.data.frame = T)
View(raw_welfare)
str(raw_welfare)
var_labels <- attr(raw_welfare, "variable.labels")
converted_labels <- iconv(var_labels, from = "CP949", to = "UTF-8")
attr(raw_welfare, "variable.labels") <- converted_labels
View(raw_welfare)

welfare<-raw_welfare 
welfare <- rename(welfare, 
                  sex = h10_g3,                  # 성별 
                  birth = h10_g4,                # 태어난 연도 
                  marriage = h10_g10,            # 혼인 상태 
                  religion = h10_g11,            # 종교 
                  income = p1002_8aq1,           # 월급 
                  code_job = h10_eco9,           # 직종 코드 
                  code_region = h10_reg7)  # 지역 코드 

list_job <- read_excel("Koweps_Codebook.xlsx", col_names = T, sheet = 2)
str(list_job)
head(list_job)
dim(list_job)

welfare <- left_join(welfare, list_job, by = "code_job")
str(welfare)
welfare %>% 
  filter(!is.na(code_job)) %>% 
  select(code_job, job) %>% 
  head(10)

job_income<- welfare %>% filter(!is.na(job)& !is.na(income)) %>% 
  group_by(job) %>% summarise(mean_income = mean(income))
 
top10 <- job_income %>% arrange(desc(mean_income)) %>% head(10)
top10

ggplot(data = top10, aes(x = reorder(job,mean_income), y= mean_income))+ geom_col()+ coord_flip()



