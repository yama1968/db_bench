
import org.apache.spark.sql.SQLContext

def time[A](a: => A) = {
        val now = System.nanoTime
       val result = a
       val micros = (System.nanoTime - now) / 1000
       println("%d microseconds".format(micros))
       result
    }


val sqlContext = new SQLContext(sc)
val df = sqlContext.read
    .format("com.databricks.spark.csv")
    .option("header", "true") // Use first line of all files as header
    .option("inferSchema", "true") // Automatically infer data types
    .load("/home/yannick/tmp/train.csv")

df.write.format("parquet").save("/home4/yannick4/tmp/train.parquet")


import com.github.lightcopy.implicits._

spark.index.create.mode("overwrite").indexBy($"device_id").parquet("/home4/yannick4/tmp/train.parquet")

val p = spark.read.parquet("/home4/yannick4/tmp/train.parquet")

time { p.select("click", "hour", "device_id", "device_ip").filter("device_id='74d0d05a'").show }

val pdid = spark.index.parquet("/home4/yannick4/tmp/train.parquet")

time {pdid.select("click", "hour", "device_id", "device_ip").filter($"device_id" === "74d0d05a").show}

p.createOrReplaceTempView("train")

time {
  spark.sql("""select device_id, cnt from (
                    select device_id, count(*) as cnt from train group by device_id
                  ) as foo
                  where cnt < 20
                  order by cnt desc
                  limit 20""").show
}
