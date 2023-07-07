MODEL (
  name source.gagal,
  dialect duckdb,
  kind FULL,
  tags [source, parquet]
);

SELECT DISTINCT data_id::VARCHAR AS id_data FROM read_parquet('../data/gagal.parquet')
