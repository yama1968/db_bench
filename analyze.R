
library(dplyr)
library(tidyr)

rslt <- read.csv("report.csv") %>%
  spread(attr, value)
rslt
