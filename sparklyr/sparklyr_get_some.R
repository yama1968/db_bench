
library(dplyr)


bench.count.some <- function(df) {

  # Count clicks with banner_pos 3. Should be around 2035
  # ~ 1.4 sec

  print(system.time(banner.3 <- df %>%
                      filter(banner_pos == 3) %>%
                      summarise(cnt = n()) %>%
                      collect))

  banner.3
}


bench.get.some <- function(df) {

  # Get clicks with banner_pos 3. Should be around 2035
  # Good test for extraction of a few rows deep inside the rest
  # ~ 4-16 sec depending on cache...

  print(system.time(banner.3 <- df %>%
                      filter(banner_pos == 3) %>%
                      collect))

  banner.3
}

bench.better.get.some <- function(df) {

  # Get clicks with banner_pos 3. Should be around 2035
  # Good test for extraction of a few rows deep inside the rest
  # ~ 4-16 sec depending on cache...

  print(system.time({
    df %>%
      filter(banner_pos == 3) %>%
      sdf_register(name = "banner_3")
    tbl_cache(sc, "banner_3")
  }))

  tbl(sc, "banner_3")
}
