
import org.apache.spark.sql.SQLContext

def time[A](a: => A) = {
        val now = System.nanoTime
       val result = a
       val micros = (System.nanoTime - now) / 1000
       println("%d microseconds".format(micros))
       result
    }

import org.apache.spark.sql._
val sqlContext = new org.apache.spark.sql.hive.HiveContext(sc)

val df = sqlContext.read
    .format("com.databricks.spark.csv")
    .option("header", "true") // Use first line of all files as header
    .option("inferSchema", "true") // Automatically infer data types
    .load("/home/yannick/tmp/train.csv")

time {df.write.format("orc").option("orc.bloom.filter.columns", "device_id").save("/home4/yannick4/tmp/train.orc")}

val clicks = sqlContext.read.format("orc").load("/home4/yannick4/tmp/train.orc")

time { clicks.select("click", "hour", "device_id", "device_ip").filter("device_id='74d0d05a'").show }

clicks.createOrReplaceTempView("train")

time (spark.sql("select click, count(*) as cnt from train group by click order by click").show)

time {
  spark.sql("""select device_id, cnt from (
                    select device_id, count(*) as cnt from train group by device_id
                  ) as foo
                  where cnt < 20
                  order by cnt desc
                  limit 20""").show
}

//

sqlContext.setConf("spark.sql.orc.filterPushdown", "true")
time { clicks.select("click", "hour", "device_id", "device_ip").filter("device_id='74d0d05a'").show }

time {df.write.format("orc")
        .option("orc.bloom.filter.columns", "device_id")
        .option("orc.create.index", "true")
        .save("/home4/yannick4/tmp/train2.orc")}
val clicks2 = sqlContext.read.format("orc").load("/home4/yannick4/tmp/train2.orc")
time { clicks2.select("click", "hour", "device_id", "device_ip").filter("device_id='74d0d05a'").show }

clicks2.createOrReplaceTempView("train2")

time (spark.sql("select click, count(*) as cnt from train2 group by click order by click").show)

time {
  spark.sql("""select device_id, cnt from (
                    select device_id, count(*) as cnt from train2 group by device_id
                  ) as foo
                  where cnt < 20
                  order by cnt desc
                  limit 20""").show
}

time {df.write.format("orc")
        .option("orc.bloom.filter.columns", "device_id")
        .option("orc.create.index", "true")
        .partitionBy("hour")
        .save("/home4/yannick4/tmp/train3.orc")}

val clicks3 = sqlContext.read.format("orc").load("/home4/yannick4/tmp/train3.orc")
time { clicks3.select("click", "hour", "device_id", "device_ip").filter($"device_id" === "74d0d05a").show }

time { clicks2.select("click", "hour", "device_id", "device_ip").filter($"hour" === "14102916").filter($"device_id" === "74d0d05a").show }
time { clicks3.select("click", "hour", "device_id", "device_ip").filter($"hour" === "14102916").filter($"device_id" === "74d0d05a").show }

time( clicks3.groupBy("click").count().show )
