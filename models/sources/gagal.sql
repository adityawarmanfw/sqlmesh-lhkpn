MODEL (
  name source.gagal,
  dialect duckdb,
  kind VIEW,
  tags [source, parquet]
);

SELECT data_id::VARCHAR AS id_data FROM read_parquet('../../data/gagal.parquet')
