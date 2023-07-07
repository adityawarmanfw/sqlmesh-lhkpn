MODEL (
  name staging.nik_daerah,
  dialect duckdb,
  kind FULL,
  tags [staging]
);

SELECT 
    id_data::VARCHAR,
    nik::VARCHAR,
    nama_provinsi::VARCHAR,
    nama_kota_kabupaten::VARCHAR,
    nama_kecamatan::VARCHAR
FROM source.tabel_situs tabel_situs
LEFT JOIN staging.daerah daerah
  ON LEFT(tabel_situs.nik, 6) = daerah.id_kecamatan
