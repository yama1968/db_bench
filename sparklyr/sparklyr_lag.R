
library(dplyr)

bench.lag <- function(df) {

  # benchmark the use of the lag function
  # sparklyr should get ~ 44 sec


  train3 <- df %>%
    mutate(int_day = substr(hour, 5, 2),
           int_hour = substr(hour, 7, 2))
  train3 %>% select(id, int_day, int_hour)

  device_plus_dt <- train3 %>%
    group_by(device_id, device_ip, int_day) %>%
    arrange(int_hour) %>%
    select(device_id, device_ip,
           int_day, int_hour) %>%
    mutate(dt_hour = int_hour - lag(int_hour)) %>%
    ungroup()

  print(system.time(bar <- device_plus_dt %>%
                      filter(is.null(dt_hour)) %>%
                      count() %>%
                      collect))

  bar
}
