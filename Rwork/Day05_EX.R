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

str(welfare)
welfare <-welfare[ c("birth","code_region")]
welfare$age <- 2025 - welfare$birth
welfare <-welfare[ c("age","code_region")]
welfare$ageg <- welfare %>%
  mutate(age_group = case_when(
    age < 25        ~ "young",
    age >= 65       ~ "old",
    TRUE            ~ "middle"
  ))
list_region <- read_excel("Koweps_Codebook.xlsx", col_names = T, sheet = 1)

list_region <- data.frame(code_region = 1:8,지역명 = c("서울","수도권","인천/경기","부산/경남/울산","대구/경북","대전/충남","강원/충북","광주/전남/전북/제주도"))

list_region
welfare<- left_join(welfare,list_region,by = "code_region")
region_ageg <- welfare %>% filter(!is.na(지역명)& !is.na(age)) %>% group_by(지역명,ageg) %>% summarise(count = n()) %>% mutate(pct= count/sum(count)* 100)
region_ageg
ggplot(data= region_ageg, aes(x =지역명,y= pct,fill = ageg$age))+ geom_col()+coord_flip()
