library(tidyverse)

s0 <- read_csv("/Users/teddydong/Documents/Stats 68/r4ds/season0.csv")
s1 <- read_csv("/Users/teddydong/Documents/Stats 68/r4ds/season1.csv")
s2 <- read_csv("/Users/teddydong/Documents/Stats 68/r4ds/season2.csv")
s3 <- read_csv("/Users/teddydong/Documents/Stats 68/r4ds/season3.csv")
s4 <- read_csv("/Users/teddydong/Documents/Stats 68/r4ds/season4.csv")
s5 <- read_csv("/Users/teddydong/Documents/Stats 68/r4ds/season5.csv")
s6 <- read_csv("/Users/teddydong/Documents/Stats 68/r4ds/season6.csv")
s7 <- read_csv("/Users/teddydong/Documents/Stats 68/r4ds/season7.csv")
s8 <- read_csv("/Users/teddydong/Documents/Stats 68/r4ds/season8.csv")
s9 <- read_csv("/Users/teddydong/Documents/Stats 68/r4ds/season9.csv")
s10 <- read_csv("/Users/teddydong/Documents/Stats 68/r4ds/season10.csv")

s0 <- s0 %>% mutate(source = 0)
s1 <- s1 %>% mutate(source = 1)
s2 <- s2 %>% mutate(source = 2)
s3 <- s3 %>% mutate(source = 3)
s4 <- s4 %>% mutate(source = 4)
s5 <- s5 %>% mutate(source = 5)
s6 <- s6 %>% mutate(source = 6)
s7 <- s7 %>% mutate(source = 7)
s8 <- s8 %>% mutate(source = 8)
s9 <- s9 %>% mutate(source = 9)
s10 <- s10 %>% mutate(source = 10)

season <- rbind(s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10)
colnames(season)
season <- rename(season,
                 id = V1,
                 `player value` = V2,
                 `training hours(weekly)` = V3,
                 age = V4,
                 injuries = V5,
                 location = V6,
                 gender = V7,
                 sport = V8
)
season$sport <- gsub("^\\s+|\\s+$|\\\"", "", season$sport)
season$gender <- gsub("^\\s+|\\s+$|\\\"", "", season$gender)
season$location <- gsub("^\\s+|\\s+$|\\\"", "", season$location)
season <- season %>%
  mutate(sport = case_when(sport == "1" ~ "Basketball",
                           sport == "2" ~ "Football",
                           sport == "3" ~ "Soccer",
                           sport == "4" ~ "Tennis",
                           sport == "5" ~ "Baseball",
                           sport == "6" ~ "Boxing",
                           TRUE ~ as.character(sport)))
season <- season %>%
  mutate(gender = case_when(gender == "2" ~ "Male",
                            gender == "1" ~ "Female"))
season <- season %>%
  mutate(location = case_when(location == "7" ~ "Saudia Arabia",
                              location == "6" ~ "USA",
                              location == "5" ~ "Spain",
                              location == "4" ~ "Germany",
                              location == "3" ~ "France",
                              location == "2" ~ "Italy",
                              location == "1" ~ "UK"))
sum(is.na(season$`player value`))
season$`player value` <- as.character(season$`player value`)
season$`player value` <- gsub("[^0-9.]", "", season$`player value`)
season$`player value` <- as.double(season$`player value`)
season$injuries <- as.character(season$injuries)
season$injuries <- gsub("[^0-9.]", "", season$injuries)
season$injuries <- as.double(season$injuries)
season$age <- as.character(season$age)
season$age <- gsub("[^0-9.]", "", season$age)
season$age <- as.double(season$age)
season$`training hours(weekly)` <- as.character(season$`training hours(weekly)`)
season$`training hours(weekly)` <- gsub("[^0-9.]", "", season$`training hours(weekly)`)
season$`training hours(weekly)` <- as.double(season$`training hours(weekly)`)
season$id <- as.character(season$id)
season$id <- gsub("[^0-9.]", "", season$id)
season$id <- as.double(season$id)

season$id <- factor(season$id, levels = 1:50)
season$gender <- factor(season$gender, levels = c("Male","Female"))
season$location <- factor(season$location, levels = c("Saudia Arabia", "USA", "Spain","Germany",
                                                      "France","Italy","UK"))
season$sport <- factor(season$sport, levels = c("Boxing","Baseball","Tennis","Soccer",
                                                "Football","Basketball"))
summary(season)
view(season)
season0content <- filter(season, source == 0)
summary(season0content)

set.seed(455)
temp = sample(1:50,10)
ten_players <- season %>%
  filter(id %in% temp)
seasons_played_plot <- ten_players %>%
  ggplot(aes(x = source, y = `player value`,color = factor(id))) + geom_line() +
  labs(title = "Examining Player Value Throughout Seasons Played",
      x = "Season", y = "Player Value")
seasons_played_plot$labels$colour <- "ID"
print(seasons_played_plot)

training_hours <- season %>%
  ggplot(aes(x = `training hours(weekly)`)) + geom_bar() +
  labs(title = "Examining The Distribution of Weekly Training Hours Throughout Seasons",
       x = "Training Hours (weekly)", y = "Count")
print(training_hours)

gender_distribution <- season %>%
  ggplot(aes(x = gender, fill = gender)) + geom_bar() +
  labs(title = "Distribution of Gender in the Combined Seasonal Dataset",
       x = "Gender", y = "Count")
gender_distribution$labels$fill <- "Gender"
print(gender_distribution)

sport_distribution <- season %>%
  ggplot(aes(x = sport, color = sport,fill = sport)) + geom_bar() +
  labs(title = "Distribution of Sports in the Combined Seasonal Dataset",
       x = "Sport", y = "Count")
sport_distribution$labels$fill <- "Sport"
print(sport_distribution)

location_plot <- season0content %>%
  group_by(location) %>%
  na.omit() %>%
  ggplot(aes(x = location, y = `player value`, color = factor(location))) +
  geom_boxplot() + 
  labs(title = "Examining Player Value Based on Location",
       x = "Location", y = "Player Value")
location_plot$labels$colour <- "Location"

print(location_plot)

sport_plot <- season0content %>%
  group_by(sport) %>%
  na.omit() %>%
  ggplot(aes(x = sport, y = `player value`, color = factor(sport))) +
  geom_boxplot() + 
  labs(title = "Average Player Value Based on Sport Played",
       x = "Sport", y = "Player Value")
sport_plot$labels$colour <- "Sport"
print(sport_plot)

gender_plot <- season0content %>%
  group_by(gender) %>%
  na.omit() %>%
  ggplot(aes(x = gender, y = `player value`, color = factor(gender))) +
  geom_boxplot() +
  labs(title = "Average Player Value Based on Gender",
       x = "Gender", y = "Player Value")
gender_plot$labels$colour <- "Gender"

print(gender_plot)

view(season0content)
value_by_hours_trained <- ggplot(data = season0content, aes(x = `training hours(weekly)`,
                                                            y = `player value`))+geom_point() +
                                                            geom_smooth(method = "lm") +
  labs(title = "Player Value Based on Weekly Training Hours in Season 0",
       x = "Training Hours (Weekly)",
       y = "Player Value")
print(value_by_hours_trained)

value_by_age <- ggplot(data = season0content, aes(x = `age`,
                                                     y = `player value`))+geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "Player Value Based on Age in Season 0",
       x = "Age",
       y = "Player Value")
print(value_by_age)

value_by_injuries <- ggplot(data = season0content, aes(x = `injuries`,
                                                  y = `player value`))+geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "Player Value Based on Injuries in Season 0",
       x = "Injuries",
       y = "Player Value")
print(value_by_injuries)

season0content <- season0content %>% select(-source)
season_changes <- season0content %>%
  pairs()


