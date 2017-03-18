
library(sparklyr)
library(dplyr)

sc <- spark_connect(master = "local",
                    config = spark_config("spark.yml"))

int_cols = c("click", "C1", "banner_pos", "device_type", "device_conn_type", "C14", "C15", "C16", "C17", "C18", "C19", "C20", "C21")

foo <- read.csv("/home/yannick/tmp/train10k.csv", nrows = 1000spark)

col_types <- list()
for (c in names(foo)) {
  if ( c %in% int_cols )
    col_types[[c]] = "integer"
  else
    col_types[[c]] = "character"
}

csv2parquet <- function(dataset,
                        this.sc = sc,
                        src.dir = "/home/yannick/tmp/",
                        dst.dir = "/home4/yannick4/tmp/",
                        my.cols = col_types) {

  src.file <- paste0(src.dir, dataset, ".csv")
  print(src.file)

  print(system.time(df_tbl <- spark_read_csv(this.sc,
                                             name = dataset,
                                             path = src.file,
                                             repartition = 0,
                                             memory = FALSE,
                                             overwrite = TRUE,
                                             infer_schema = FALSE,
                                             columns = my.cols)))

  options <- spark_config()
  options$spark.sql.parquet.compression.codec <- "snappy"
  system.time(spark_write_parquet(df_tbl,
                                  path = paste0(dst.dir, dataset, ".parquet"),
                                  mode = "overwrite",
                                  options = options))
}

csv2parquet("train10k")
csv2parquet("train")

spark_disconnect(sc)
