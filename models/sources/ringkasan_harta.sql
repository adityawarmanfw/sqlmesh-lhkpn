MODEL (
  name source.ringkasan_harta,
  dialect duckdb,
  kind FULL,
);

SELECT DISTINCT
    data_id::VARCHAR AS id_data,
    subtotal::BIGINT AS subtotal,
    total::BIGINT AS total
FROM read_parquet('../data/ringkasan_harta.parquet')
