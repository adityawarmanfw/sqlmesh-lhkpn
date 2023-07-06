MODEL (
  name my_db.my_table,
  tags haha,
  kind FULL
);

SELECT
  abc, def
FROM
  read_parquet('test.parquet')
