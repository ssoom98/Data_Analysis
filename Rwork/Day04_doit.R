rm(list = ls())
#install.packages("foreign")
library(foreign) # SPSS 파일 로드 
library(dplyr) # 전처리 
library(ggplot2) # 시각화 
library(readxl) # 엑셀 파일 불러오기
list.dirs()
raw_welfare<-read.spss("Data/Koweps_hpc10_2015_beta1.sav", to.data.frame = TRUE)


#1. 데이터 불러오기
str(raw_welfare)

# 2. 변수 라벨 추출
var_labels <- attr(raw_welfare, "variable.labels")

# 3. 라벨을 CP949 → UTF-8로 변환
converted_labels <- iconv(var_labels, from = "CP949", to = "UTF-8")

# 4. 다시 data에 붙이기
attr(raw_welfare, "variable.labels") <- converted_labels


welfare <- raw_welfare
welfare <- rename(welfare, 
                  sex = h10_g3, # 성별 
                  birth = h10_g4, # 태어난 연도 
                  marriage = h10_g10, # 혼인 상태 
                  religion = h10_g11, # 종교 
                  income = p1002_8aq1, # 월급 
                  code_job = h10_eco9, # 직종 코드 
                  code_region = h10_reg7) # 지역 코드


## "성별에 따라 월급이 다를까?" - 성별, 월급

class(welfare$sex)
# summary(welfare$sex)
table(welfare$sex)
sum(is.na(welfare$sex))

# 이상치 확인
summary(welfare$sex)

welfare$sex <- ifelse(welfare$sex == 1, "male","female")
welfare$sex
table(welfare$sex)
qplot(welfare$sex)

class(welfare$income)
summary(welfare$income)
qplot(welfare$income, fill = I("skyblue"), color = I("black")) + xlim(0,1000)

summary(welfare$income)
welfare$income<- ifelse(welfare$income %in% c(0,9999),NA, welfare$income)
summary(welfare$income)
table(is.na(welfare$income))

sex_income <- welfare %>% filter(!is.na(income))

View(sex_income)

summary(sex_income)
#3dim(sex_income)

sex_income <- welfare %>% filter(!is.na(income)) %>% group_by(sex) %>%  summarise(mean_income = mean(income))

sex_income

ggplot(data = sex_income, aes(x = sex, y= mean_income)) + geom_col()



