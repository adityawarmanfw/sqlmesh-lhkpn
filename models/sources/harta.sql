MODEL (
  name source.harta,
  dialect duckdb,
  kind FULL,
  tags [source, parquet]
);

SELECT DISTINCT
    data_id::VARCHAR AS id_data,   
    id::BIGINT AS id_harta,
    parent_id::BIGINT AS id_induk_harta,
    UPPER(kategori)::VARCHAR AS kategori_harta,
    UPPER(harta_deskripsi)::VARCHAR AS deskripsi_harta,
    UPPER(harta_nilai)::BIGINT AS nilai_harta
FROM read_parquet('../data/harta.parquet')

