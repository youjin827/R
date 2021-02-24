install.packages("stringi")

install.packages("devtools")
devtools::install_github("cardiomoon/kormaps2014")
str(changeCode(korpop1))
library(kormaps2014)
library(dplyr)
korpop1 <- rename(korpop1,
                  pop = 총인구_명,
                  name = 행정구역별_읍면동)

str(changeCode(kormap1))
library(dplyr)
korpop1 <- rename(korpop1,
                  pop = 총인구_명,
                  name = 행정구역별_읍면동)
korpop1$name <- iconv(korpop1$name, "UTF-8", "CP949")

str(changeCode(kormap1))

ggChoropleth(data = korpop1,       # 지도에 표현할 데이터
             aes(fill = pop,       # 색깔로 표현할 변수
                 map_id = code,    # 지역 기준 변수
                 tooltip = name),  # 지도 위에 표시할 지역명
             map = kormap1) 

install.packages("plotly")
library(plotly)

library(ggplot2)
p <- ggplot(data = mpg, aes(x = displ, y = hwy, col = drv)) + geom_point()

ggplotly(p)


#인터렉티브 막대 그래프 그리기
p <- ggplot(data = diamonds, aes(x=cut, fill=clarity)) +
  geom_bar(position = "dodge")

ggplotly(p)

# 인터랙티브 시계열 그래프 만들기 ----
install.packages("dygraphs")
library(dygraphs)

economics <- ggplot2::economics
head(economics)

library(xts)
eco <- xts(economics$unemploy, order.by = economics$date)
head(eco)

dygraph(eco)

#날짜 범위 선택 기능
dygraph(eco) %>% dyRangeSelector()


#여러 값 표현
# 저축률
eco_a <- xts(economics$psavert, order.by = economics$date)

#실업자 수
eco_b <- xts(economics$unemploy/1000, order.by = economics$date)

eco2 <- cbind(eco_a, eco_b)
colnames(eco2) <- c("psavert", "umemploy")
head(eco2)


dygraph(eco2) %>% dyRangeSelector(
  
)
