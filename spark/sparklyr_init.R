
library(sparklyr)
library(dplyr)

# sc <- spark_connect(master = "local",
#                     config = spark_config("spark.yml"))

# should ./sbin/start_all.sh beforehand!

sc <- spark_connect(master = "spark://patty:7077",
                    spark_home = "/home/yannick/Work/3p/spark-2.1.0-bin-hadoop2.7")

system.time(
  train <- spark_read_parquet(sc,
                              "train",
                              "/home4/yannick4/tmp/train.parquet",
                              memory = FALSE,
                              overwrite = TRUE)
)


system.time(
  train10k <- spark_read_parquet(sc,
                              "train10k",
                              "/home4/yannick4/tmp/train10k.parquet",
                              memory = FALSE,
                              overwrite = TRUE)
)
