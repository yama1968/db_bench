
library(sparklyr)

config <- spark_config()
config[["sparklyr.defaultPackages"]] <- c(
  "datastax:spark-cassandra-connector:2.0.0-RC1-s_2.11")
config[["sparklyr.shell.driver-memory"]] <- c("8G")

sc <- spark_connect(master = "local", config = config)

df <- sparklyr:::spark_data_read_generic(
  sc,
  "org.apache.spark.sql.cassandra",
  "format", list(
    keyspace = "test",
    table = "train"
  )) %>% invoke("load")

system.time(
cassandra_tbl <- sparklyr:::spark_partition_register_df(
  sc,
  df,
  name = "Train",
  repartition = 0,
  memory = FALSE)
)
# ok with memory=FALSE
# crashes with memory=TRUE

library(dplyr)

system.time( clicks <- cassandra_tbl %>% group_by(click) %>% summarise(cnt = n()) %>% collect)
# 146 sec with memory = FALSE
# 146 sec with memory = FALSE and index on click
#  sec with memory = TRUE
clicks

library(DBI)
system.time(foo <- dbGetQuery(sc, "select banner_pos, count(*) as nb, avg(click) as p
       from train
       group by banner_pos
       order by banner_pos"))
foo
# with memory = FALSE
#  sec with memory = TRUE



