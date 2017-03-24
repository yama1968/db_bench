

DROP TABLE IF EXISTS Train_prepared;

CREATE VIEW Train_prepared
    AS
SELECT id,
       click,
       toDate('20' || substring(hour, 1, 2) || '-' ||
              substring(hour, 3, 2) || '-' ||
              substring(hour, 5, 2)
              ) AS show_date,
       toDateTime('20' || substring(hour, 1, 2) || '-' ||
              substring(hour, 3, 2) || '-' ||
              substring(hour, 5, 2) || ' ' ||
              substring(hour, 7, 2) || ':00:00'
              ) AS show_datetime,
       substring(hour, 7,2) AS show_hour,
       hour,
       C1,
       banner_pos,
       site_id,
       site_domain,
       site_category,
       app_id,
       app_domain,
       app_category,
       device_id,
       device_ip,
       device_model,
       device_type,
       device_conn_type,
       C14,
       C15,
       C16,
       C17,
       C18,
       C19,
       C20,
       C21
  FROM Train;
