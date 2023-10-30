
# source: https://cran.r-project.org/web/packages/dplyr/vignettes/dplyr.html

library(dplyr)

# starwars
print('------ Print starwars tibble ------')
starwars

# selection examples
print('------ filter example ------')
starwars %>% filter(skin_color == 'light', eye_color == 'brown')

print('------ select example ------')
starwars %>% select(hair_color, skin_color, eye_color)

# piping examples
print('------ piping example ------')
starwars %>%
  group_by(species, sex) %>%
  select(height, mass) %>%
  summarise(
    height = mean(height, na.rm = TRUE),
    mass = mean(mass, na.rm = TRUE),
  )
